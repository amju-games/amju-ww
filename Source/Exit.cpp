#include <ConfigFile.h>
#include <StringUtils.h>
#include <DegRad.h>
#include <Game.h>
#include <Timer.h>
#include <Colour.h>
#include <ROConfig.h>
#include "Exit.h"
#include "GameConsts.h"
#include "GameObjectFactory.h"
#include "GSLevelComplete.h"
#include "GSMain.h"
#include "LevelManager.h"
#include "LoadMeshResource.h"
#include "LoadVec3.h"
#include "MySceneGraph.h"
#include "NetSend.h"
#include "PlayWav.h"
#include "PowerUp.h"
#include "PropertiesDialog.h"
#include "PropertyKeys.h"
#include "RDRandom.h"
#include "SceneMesh.h"
#include "ShareManager.h"
#include "TextMaker.h"

namespace Amju
{
GameObject* CreateExit() { return new Exit; }

#ifdef GLOBAL_INIT
static bool reg = TheGameObjectFactory::Instance()->Add(Exit::NAME, &CreateExit);
#endif

const char* Exit::NAME = "exit";

static const float XSIZE = 5.0f;
static const float YSIZE = 20.0f;
static const float ZSIZE = 20.0f;

Exit::Exit()
{
  m_aabbExtents = Vec3f(XSIZE, YSIZE, ZSIZE);
  m_extentsSet = true;

  m_isActive = false;
  m_activeTime = 0;
  m_rotate = 0;
  m_toLevel = 0;
  m_isExiting = false;
}
  
bool Exit::YesAddToLevel(int levelId, float depth)
{
  if (depth < 1000)
  {
    return false;
  }
  // PROCGEN
  bool yes = RDRandom(10) > 4;
  return yes;
}

void Exit::Customise(int levelId, float depth) 
{
  // TODO TEMP TEST
  int d = (int)depth / 1000;
  m_toLevel = levelId + 1  + d * 2; 
}

WWGameObject* Exit::Clone() 
{
  return new Exit(*this);
}

const char* Exit::GetTypeName() const
{
  return NAME;
}

void Exit::AddToGame() 
{
  StaticFloor::AddToGame();
  RecalcAABB();

  Assert(m_text);
  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  Assert(root);
  root->AddChild(m_text);
  root->AddChild(m_cylinder);
}

void Exit::RemoveFromGame() 
{
  StaticFloor::RemoveFromGame();

  Assert(m_text);
  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  Assert(root);
  root->DelChild(m_text);
  root->DelChild(m_cylinder);
}

void Exit::AddPropertiesGui(PropertiesDialog* dlg) 
{
  StaticFloor::AddPropertiesGui(dlg);

  dlg->AddItem(new PropertiesDialog::IntItem("Dest level", m_toLevel, PROP_DEST_ID));
}

PropertyValue Exit::GetProp(PropertyKey key)
{
  switch (key)
  {
  case PROP_DEST_ID:
    return m_toLevel;
  }

  return StaticFloor::GetProp(key);
}

void Exit::SetProp(PropertyKey key, PropertyValue value)
{
  StaticFloor::SetProp(key, value);

  switch (key)
  {
  case PROP_DEST_ID:
    m_toLevel = value.GetInt();
  }
}

void Exit::Reset()
{
  StaticFloor::Reset();
 
  m_isActive = false;
  m_isExiting = false;
}

void Exit::Update()
{
  float dt = TheTimer::Instance()->GetDt();
  static const float ROT_SPEED = 3.0f;
  m_rotate += ROT_SPEED * dt;

  Matrix mat;
  mat.RotateY(m_rotate);
  mat.TranslateKeepRotation(m_pos);
  m_cylinder->SetLocalTransform(mat);

  if (m_isExiting)
  {
    m_activeTime += dt;
    Matrix mat;
    static const float BB_EXPAND = ROConfig()->GetFloat("exit-bb-expand");
    float sc = 1.0f + m_activeTime * BB_EXPAND;
    mat.Scale(sc, sc, sc);
    m_billboard->MultLocalTransform(mat);
  }
  
  static const float EXIT_DELAY_1 = ROConfig()->GetFloat("exit-delay-1");

  if (m_isExiting && 
      m_activeTime > EXIT_DELAY_1) 
  {
    // Go to next level
    // TODO Sound effect, explosion etc
    m_effect->SetVisible(true);

    // Set next level
    TheLevelManager::Instance()->SetLevelId(m_toLevel);
    TheGSMain::Instance()->SetExitState(GSMain::FINISHED_EXITING);
    // Set share text so when we get to load level state, we can "share" the new level
    char buf[SHARE_MAX_BUF_LEN];
    // TODO Safe version with max buffer length
    sprintf(buf, "I just got to level %d on Amju Rainbow Drop! amju.com #amju", m_toLevel);
    TheShareManager::Instance()->SetShareText(buf);
  }
}

bool Exit::Save(File* f)
{
  if (!StaticFloor::Save(f))
  {
    return false;
  }

  // Next level
  f->WriteComment("// Next level");
  f->WriteInteger(m_toLevel);

  return SaveShadow(f);
}

bool Exit::Load(File* f)
{ 
  if (!StaticFloor::Load(f))
  {
    return false;
  }
  m_startPos = m_pos;

  // Load next level
  if (!f->GetInteger(&m_toLevel))
  {
    f->ReportError("Expected next level");
    return false;
  }

  if (!LoadShadow(f))
  {
    return false;
  }

  return true;
}

bool Exit::CreateSceneNode()
{
  if (!StaticFloor::CreateSceneNode())
  {
    return false;
  }

  // Rotating cylinder
  ObjMesh* mesh = (ObjMesh*)TheResourceManager::Instance()->GetRes("transporter2.obj");
  if (!mesh)
  {
    return false;
  }

  SceneMesh* sm  = new SceneMesh;
  sm->SetMesh(mesh);
  sm->SetBlended(true);
  sm->SetIsZWriteEnabled(false);
  Matrix mat;
  mat.Translate(m_pos);
  sm->SetLocalTransform(mat);
  m_cylinder = sm;

  TextMaker tm;
  tm.SetDataDir("obj/font3d/");
  m_text = tm.MakeText(ToString(m_toLevel));

  // Transformation for text
  mat.SetIdentity();
  Matrix mat2;
  // Rotate the text 90 degs about x, so it's vertical
  mat.RotateX(DegToRad(90.0f));
  mat2.Scale(20, 20, 20);
  mat *= mat2;
  // TODO Vary height?
  mat.TranslateKeepRotation(m_pos + Vec3f(0, 40.0f, 0));
  m_text->SetLocalTransform(mat);
  // Text is black
  m_text->SetColour(Colour(0.2f, 0.2f, 0.2f, 1));

  m_billboard = new Billboard;
  m_billboard->SetVisible(false);
  m_billboard->SetIsZReadEnabled(false);
  Texture* bbtex = (Texture*)TheResourceManager::Instance()->GetRes("flare.png");
  Assert(bbtex);
  m_billboard->SetTexture(bbtex);
  m_billboard->SetSize(50.0f); 
  GetSceneNode()->AddChild(m_billboard);

  m_effect = new ExitParticleEffect;
  m_effect->SetVisible(true);
  // So particles rotate with cylinder
  m_cylinder->AddChild(m_effect);

  // Set nice big AABB for text, billboard and effect, so they are not culled
  static const float X2 = 40.0f;
  static const float Y2 = 40.0f;
  AABB aabb(-X2, X2, -Y2, Y2, -X2, X2);
  aabb.Translate(m_pos);
  m_text->RecursivelyTransformAABB(mat);
  m_billboard->SetAABB(aabb);
  m_effect->SetAABB(aabb);
  m_cylinder->SetAABB(aabb);

  // Currently there are no objectives, so all exits are enabled
  SetActive(); 

  return true;
}

void Exit::OnPlayerCollision()
{
  NetSendPlaySession(NET_SEND_LEVEL_COMPLETE);
  
  Assert(!m_isExiting); // already called
  m_isExiting = true;

  m_text->SetVisible(false);

  // Do this if we go directly to GSLevelCompleted state, with no time delay
  TheLevelManager::Instance()->SetLevelId(m_toLevel);

  GameConfigFile* gcf = TheGameConfigFile::Instance();
  gcf->SetInt(CONTINUE_LEVEL_KEY, m_toLevel);

  m_cylinder->SetVisible(false);

  PlayWav("button112");

  ThePowerUpManager::Instance()->ResetPowerUps();
}

ExitParticleEffect::ExitParticleEffect()
{
  Set("sparkle1.png", 2.0f, 50, 2.0, 0);
}

static float rnd(float f)
{
  return ((float)rand() / (float)RAND_MAX * 2.0f * f - f);
}

Vec3f ExitParticleEffect::NewPos() const
{
  float SIZE = 15.0f;
  return Vec3f(rnd(SIZE), 0, rnd(SIZE));
}

Vec3f ExitParticleEffect::NewVel() const
{
  return Vec3f(0, 50.0f, 0);
}

float ExitParticleEffect::NewTime() const
{
  return (float)rand() / (float)RAND_MAX * 1.0f;
}

void ExitParticleEffect::HandleDeadParticle(Particle2d* p)
{
  Recycle(p);
}

void Exit::SetActive()
{
  if (m_isActive)
  {
    return;
  }

  m_isActive = true;
  m_activeTime = 0;
  m_effect->Start();
  m_billboard->SetVisible(true);
  GetSceneNode()->SetColour(Colour(1, 1, 1, 1));
}
}
