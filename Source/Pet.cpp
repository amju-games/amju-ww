#include <Game.h>
#include <GameObjectFactory.h>
#include <File.h>
#include <Timer.h>
#include <DegRad.h>
#include <AmjuRand.h>
#include <ROConfig.h>
#include "Pet.h"
#include "BlinkCharacter.h"
#include "MySceneGraph.h"
#include "AIGoHighGround.h"
#include "AIIdle.h"
#include "AIFalling.h"
#include "AIFlee.h"
#include "Floor.h"
#include "ShadowManager.h"
#include "Dino.h"
#include "PlayWav.h"
#include "Describe.h"
#include "PropertiesDialog.h"
#include "Player.h"

namespace Amju
{
GameObject* CreatePet() { return new Pet; }
static bool reg = TheGameObjectFactory::Instance()->Add(Pet::NAME, &CreatePet);

const char* Pet::NAME = "pet";

static const float XSIZE = 15.0f;
static const float YSIZE = 20.0f;
static const float YOFFSET = 5.0f;

static const float MAX_BEING_EATEN_TIME = 6.0f;

// TODO Keep track of Pets with static container
void GetPets(Pets* pets)
{
  GameObjects* objs = TheGame::Instance()->GetGameObjects();
  for (GameObjects::iterator it = objs->begin(); it != objs->end(); ++it)
  {
    GameObject* go = it->second;
    Pet* p = dynamic_cast<Pet*>(go);
    if (p && !p->IsDead())
    {
      pets->push_back(p);
    }
  }
}

Pet::Pet()
{
  m_aabbExtents = Vec3f(XSIZE, YSIZE, XSIZE);
  m_extentsYOffset = YSIZE + YOFFSET;

  m_extentsSet = true;
  m_carryingPlayer = 0;
  m_eatenState = NOT_EATEN_YET;
  m_eatenTime = 0;
  m_justDroppedTime = 0;
  m_justDropped= false;
  m_bloodPoolScale = 0;
}
  
void Pet::AddPropertiesGui(PropertiesDialog* dlg) 
{
  Npc::AddPropertiesGui(dlg);
}

PropertyValue Pet::GetProp(PropertyKey key)
{
//  switch (key)
//  {
//  case PROP_TEXT:
//    return m_text;
//  }
  return Npc::GetProp(key);
}

void Pet::SetProp(PropertyKey key, PropertyValue value)
{
  Npc::SetProp(key, value);
//  switch (key)
//  {
//  case PROP_TEXT:
//    m_text = value.GetString();
//  }
}

bool Pet::JustDropped() const
{
  return m_justDropped;
}
  
bool Pet::CanBeEaten() const
{
  bool b = !m_justDropped && 
    (m_eatenState == NOT_EATEN_YET) && 
    !IsDead() &&
    !IsFalling();

  return b;
}

void Pet::AddToGame() 
{
  Npc::AddToGame();
  
//  AddAI(new AIGoHighGround);
  AddAI(new AIIdle);
  AddAI(new AIFalling);
  AddAI(new AIFlee);

  SetAI(AIIdle::NAME); // can set now that we have created scene node
  // (when AI state is activated, it will set animation)

  // Blood particle effect for when pet eaten
  m_bloodFx = new BloodFx;
  // Tex, size, num, time
  m_bloodFx->Set("gore.png", 2, 100, 2.0f, 0); // TODO CONFIG

  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  root->AddChild(m_bloodFx.GetPtr());

  // Create blood pool scene node
  ObjMesh* mesh = (ObjMesh*)TheResourceManager::Instance()->GetRes("blood_pool.obj");
  Assert(mesh);
  SceneMesh* sm  = new SceneMesh;
  sm->SetMesh(mesh);

  // Bad idea!
  // will give better visuals? - no, can cause blood pool to be 
  //  hidden by things drawn after 
  //sm->SetIsZWriteEnabled(false); 

  m_bloodPool = sm;
  root->AddChild(sm);
  m_bloodPool->SetVisible(false);
}

WWGameObject* Pet::Clone()
{
  return new Pet(*this);
}

const char* Pet::GetTypeName() const
{
  return NAME;
}

Player* Pet::GetCarryingPlayer()
{
  return m_carryingPlayer;
}

void Pet::OnWallCollision(const Vec3f& normal) 
{
  if (m_carryingPlayer)
  {
//    m_carryingPlayer->DropPets();
  }
}

void Pet::SetCarryingPlayer(Player* player)
{
  ShadowManager* sm = TheShadowManager::Instance();

//  Assert(!IsDead()); // this can assert in edit mode
  if (player)
  {
    Assert(!m_carryingPlayer); // already carried!
    sm->SetShadowVisible(this, false);
  }
  else
  {
    m_justDropped = true;
    sm->SetShadowVisible(this, true);
  }
  m_carryingPlayer = player;
}

void Pet::Update()
{
  if (m_carryingPlayer)
  {
    OnFloorCharacter::Update(); // no AI etc
  }
  else 
  {
    Npc::Update();
  }

  RecalcAABB();

  float dt = TheTimer::Instance()->GetDt();

  if (m_justDropped)
  {
    static const float MAX_JUST_DROPPED_TIME = ROConfig()->GetFloat("pet-max-just-dropped-time");
    m_justDroppedTime += dt;
    if (m_eatenState == NOT_EATEN_YET)
    {
      // Flash
      float t = m_justDroppedTime * 10;
      GetSceneNode()->SetVisible((int)t % 2 == 0);
    }

    if (m_justDroppedTime > MAX_JUST_DROPPED_TIME) 
    {
      m_justDropped = false;
      m_justDroppedTime = 0;
    }
  }

  if (m_eatenState == BEING_EATEN)
  {
    m_eatenTime += dt;

    if (m_eatenTime > MAX_BEING_EATEN_TIME)
    {
      m_eatenState = HAS_BEEN_EATEN;
      // TODO Fade 
      //m_bloodPool->SetVisible(false);
    }
  }

  if (m_eatenState == BEING_EATEN || m_eatenState == HAS_BEEN_EATEN)
  {
    // Increase blood pool size
    static const float MAX_BP_SCALE = ROConfig()->GetFloat("pet-bloodpool-max-scale");
    if (m_bloodPoolScale < MAX_BP_SCALE)
    {
      m_bloodPoolScale += dt; 
    }
    Vec3f s(m_bloodPoolXZSize.x * m_bloodPoolScale, 
            1.0f,
            m_bloodPoolXZSize.y * m_bloodPoolScale);

    // Rotate by floor rotation every frame if on a tilting floor
    UpdateBloodPoolRotation();

    Matrix mat; 
    mat.Scale(s.x, 1.0f, s.z);
    mat *= m_bloodPoolMatrix; // rotation due to floor shape
    mat.TranslateKeepRotation(m_bloodPoolPos); 


    // Only required if floor can tilt
    // Rotate by rotation of floor, around the floor centre
    Matrix tr1;
    tr1.Translate(-m_floor->GetPos());
    Matrix tr2;
    tr2.Translate( m_floor->GetPos());
    Matrix floorRot = tr1 * m_floorRot * tr2;
    mat *= floorRot;

    m_bloodPool->SetLocalTransform(mat);
  }
}

bool Pet::Save(File* f)
{
  if (!Npc::Save(f))
  {
    return false;
  }

  if (!f->Write(m_md2Name) || !f->Write(m_texNames[0]) || !f->Write(m_texNames[1]))
  {
    f->ReportError("Failed to write pet md2/texture data!");
    return false;
  }

  return SaveShadow(f);
}

bool Pet::Load(File* f)
{
  if (!Npc::Load(f))
  {
    return false;
  }
  m_startPos = m_pos;

  // Load mesh and 2 textures
  if (!f->GetDataLine(&m_md2Name))
  {
    f->ReportError("Expected pet md2 filename");
    return false;
  }

  if (!f->GetDataLine(&m_texNames[0]))
  {
    f->ReportError("Expected pet tex0 filename");
    return false;
  }

  if (!f->GetDataLine(&m_texNames[1]))
  {
    f->ReportError("Expected pet tex1 filename");
    return false;
  }

  /*
  const int NUM_MESHES = 3;
  static const char* MESHES[NUM_MESHES] = 
  {
    "pz-cat.md2",
    "pz-rabbit.md2",
    "pz-squirrel.md2"
  };

  const int NUM_TEXTURES = 5;
  static const char* TEXTURES[NUM_TEXTURES][2] = 
  {
    { "pz-pet1a.png", "pz-pet1.png" },
    { "pz-pet2a.png", "pz-pet2.png" },
    { "pz-pet3a.png", "pz-pet3.png" },
    { "pz-pet4a.png", "pz-pet4.png" },
    { "pz-pet5a.png", "pz-pet5.png" }
  };
  
  int r = rand() % NUM_MESHES; // TODO Load type
  m_md2Name = MESHES[r];

  r = rand() % NUM_TEXTURES; // TODO Load colour
  m_texNames[0] = TEXTURES[r][0];
  m_texNames[1] = TEXTURES[r][1];
  */

  if (!LoadShadow(f))
  {
    return false;
  }
  return true;
}

void Pet::ResetEatenState() 
{
  m_eatenState = NOT_EATEN_YET;
}

void Pet::OnAnimFinished() 
{
  Npc::OnAnimFinished();
  if (m_eatenState == BEING_EATEN)
  {
    GetSceneNode()->SetVisible(false);    
  }
}

void Pet::UpdateBloodPoolRotation()
{
  Floor* floor = const_cast<Floor*>(GetFloor());
  m_floorRot = *(floor->GetMatrix()); 
  m_floorRot.TranslateKeepRotation(Vec3f()); // just the rotation
  m_floorRot = m_invFloorMatrix * m_floorRot; // rotation relative to when blood pool created
}

void Pet::CalcBloodPoolMatrix()
{
  // Just do this once for static floors.
  Floor* floor = const_cast<Floor*>(GetFloor());
  // If we are on a static floor, get triangles under the blood pool, as
  //  floor might be a funny shape. Get a rough rotation matrix from the
  //  tris.
  CollisionMesh* cm = floor->GetCollisionMesh();
  CollisionMesh::Tris tris;
  // May need to extend box downwards?
  cm->GetAllTrisInBox(m_aabb, &tris);
     
  Vec3f normal(0, 1, 0); // normal to surface here, must point up, roughly.
  Matrix mat; // identity if normal is (0, 1, 0)
  if (tris.empty())
  {
std::cout << "Bah, no tris for blood pool.\n";
  }
  else
  {
    // Average all tri normals which face up
    int s = tris.size();
    for (int i = 0; i < s; i++)
    {
      Vec3f n = tris[i].CalcNormal(); // was tris[0] ?!??
      if (n.y > 0)
      {
        normal += n;
      }
    }
    normal.Normalise();
    // Get matrix which rotates (0, 1, 0) to this normal
    Vec3f forward(0, 0, 1);
    Vec3f right = CrossProduct(forward, normal);
    forward = CrossProduct(right, normal);

    // Ideally something like this:
    //Matrix3x3 rot(right, normal, forward);
    //mat.Set3x3(rot);
    mat[0]  = right.x;
    mat[1]  = right.y;
    mat[2]  = right.z;
    mat[4]  = normal.x;
    mat[5]  = normal.y;
    mat[6]  = normal.z;
    mat[8]  = forward.x;
    mat[9]  = forward.y;
    mat[10] = forward.z;
  }

  m_bloodPoolMatrix = mat;
  m_invFloorMatrix = *(floor->GetMatrix());
  // Just the rotation
  m_invFloorMatrix.TranslateKeepRotation(Vec3f());
  m_invFloorMatrix = Transpose(m_invFloorMatrix); // inverse
}

void Pet::StartBeingEaten(Dino* eater)
{
  // Is only called once per pet
  Assert(m_eatenState == NOT_EATEN_YET);
  Assert(!m_justDropped);

  Amju::PlayWav("goopy");

  m_eatenState = BEING_EATEN;

  SetDead(true); // So physics won't be updated any more

  float dir = eater->GetDir();
  Matrix mat;
  mat.RotateY(DegToRad(dir));
  Vec3f pos = eater->GetPos();
  mat.TranslateKeepRotation(pos);
  GetSceneNode()->SetLocalTransform(mat);

  m_bloodPoolPos = m_pos;
  // Get accurate y
  Floor* floor = const_cast<Floor*>(GetFloor());
  CollisionMesh* cm = floor->GetCollisionMesh();
  cm->GetY(Vec2f(m_bloodPoolPos.x, m_bloodPoolPos.z), &m_bloodPoolPos.y);

  mat.Scale(0, 1, 0); // start size 0 in (x, z)
  m_bloodPool->SetLocalTransform(mat);
  m_bloodPool->SetAABB(*(GetSceneNode()->GetAABB()));
  m_bloodPool->SetVisible(true);
  m_bloodPoolXZSize = Vec2f(1.5f + Rnd(0, 1.0f), 1.5f + Rnd(0, 1.0f));

  CalcBloodPoolMatrix();

  SetAnim("eaten");

  // Remove from ShadowManager
  TheShadowManager::Instance()->RemoveCaster(this);

  m_bloodFx->SetMinY(GetPos().y);
  m_bloodFx->SetDino(eater);
  m_bloodFx->Start();

  // Make sure it's not culled
  m_bloodFx->SetAABB(*GetSceneNode()->GetAABB());
}
}
