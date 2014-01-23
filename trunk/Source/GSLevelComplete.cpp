#include <Screen.h>
#include <DegRad.h>
#include <ROConfig.h>
#include <SoundManager.h>
#include "GSLevelComplete.h"
#include "GSLoadLevel.h"
#include "MySceneGraph.h"
#include "Game.h"
#include "GSPetBonus.h"
#include "LevelManager.h"
#include "Timer.h"
#include "Pet.h"
#include "Hud.h"

namespace Amju
{
GSLevelComplete::GSLevelComplete()
{
  m_timer = 0;
  if (!m_bg.OpenAndLoad("level-complete-bg.txt"))
  {
    Assert(0);
  }
  m_z = 0;
}

void SetObjPos(WWGameObject* obj, float angle, float z)
{
  static const float RADIUS = 80.0f;
  Vec3f pos(cos(-angle) * RADIUS, sin(-angle) * RADIUS, z);
  obj->SetPos(pos);  
  obj->RecalcAABB();

  Matrix mat;
  mat.RotateY(DegToRad(angle)); // TODO
  mat.TranslateKeepRotation(pos);
  obj->GetSceneNode()->SetLocalTransform(mat);
  obj->GetSceneNode()->SetVisible(true);
}

void GSLevelComplete::Update()
{
  GSText::Update();

  GetGameSceneGraph()->Update();

  float dt = TheTimer::Instance()->GetDt();
  static const float SPEEDUP_MULT = ROConfig()->GetFloat("level-complete-star-speedup-mult");

  m_starRotVel += dt * SPEEDUP_MULT; //*= 1.01f; // TODO TEMP TEST
  
  static const float Z_VEL = 200.0f;
  static const float Z_INCREMENT = 40.0f;

  m_z -= Z_VEL * dt;

  // Circle of positions - also set y coord for sprial
  static float angle = 0; // increases per frame
  angle += DegToRad(90.0f) * dt;

  float a = angle;
  SetObjPos(m_player, a, m_z);
  m_player->SetAnim("fall");
  m_player->SetIsTeleporting(false);

  const PetList& pets = m_player->GetPets();
  for (auto it = pets.begin(); it != pets.end(); ++it)
  {
    a += DegToRad(30.0f); // TODO
    Pet* pet = const_cast<Pet*>(*it);
    SetObjPos(pet, a, m_z + Z_INCREMENT);
    pet->SetAnim("fall");
    pet->SetIsTeleporting(false);
  }   

  // Inc timer, go to next state
  m_timer += TheTimer::Instance()->GetDt();
  static const float MAX_TIME = ROConfig()->GetFloat("level-complete-max-time");
  if (m_timer > MAX_TIME) 
  {
    if (pets.empty())
    {
      TheGame::Instance()->SetCurrentState(TheGSLoadLevel::Instance());
    }
    else
    {
      // New level number is set by "Exit" object
      TheGame::Instance()->SetCurrentState(TheGSPetBonus::Instance());
    }
  }
}

void GSLevelComplete::Draw2d()
{
  // Can't see white text very well
  //TheHud::Instance()->Draw();
}

void GSLevelComplete::Draw()
{
  GSText::Draw();

/*
  // Draw rotating background
  AmjuGL::Disable(AmjuGL::AMJU_DEPTH_READ);
  AmjuGL::Disable(AmjuGL::AMJU_DEPTH_WRITE);

  // Rotate background
  static float a = 0;
  float dt = TheTimer::Instance()->GetDt();
  a -= 90.0f * dt;

  AmjuGL::PushMatrix();
  AmjuGL::RotateZ(a);
//  m_bg.Draw(); 
  AmjuGL::PopMatrix();

  AmjuGL::Enable(AmjuGL::AMJU_DEPTH_READ);
  AmjuGL::Enable(AmjuGL::AMJU_DEPTH_WRITE);

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_PROJECTION_MATRIX);
  AmjuGL::SetIdentity();
  const float FOVY = 60.0f;
  const float NEAR = 1.0f; 
  const float FAR = 3000.0f;
  float aspect = (float)Screen::X() / (float)Screen::Y();
  AmjuGL::SetPerspectiveProjection(FOVY, aspect, NEAR, FAR);
*/

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();

  // Draw player and any pets carried
  // Spiral motion?
  //GetTextSceneGraph()->Draw();
  GetGameSceneGraph()->Draw();
}

void GSLevelComplete::OnDeactive()
{
  GSText::OnDeactive();
  m_player = 0; // no need to retain player any more
  // Still need for bonus display state!
//  TheLevelManager::Instance()->Clear();
}

// Convenience function
static void AddSceneNode(WWGameObject* ww)
{
  SceneNode* sn = ww->GetSceneNode();
  if (sn)
  {
    SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
    root->AddChild(sn); 
  }  
}

void GSLevelComplete::OnActive()
{
  GSText::OnActive();

  TheSoundManager::Instance()->PlaySong("sound/spiral.it");

  CreateText("");
  // Don't kill game objects yet, we are displaying them!
  m_timer = 0;

  static const float Z_START = 250.0f;
  m_z = Z_START;

  // Show player and pets only
  GetGameSceneGraph()->Clear(); // ?
  GetGameSceneGraph()->SetRootNode(SceneGraph::AMJU_OPAQUE, new SceneNode);

  // Add scene nodes for player and carried pets
  Assert(m_player);
  AddSceneNode(m_player);
  m_player->SetPos(Vec3f());

  const PetList& pets = m_player->GetPets();
  for (auto it = pets.begin(); it != pets.end(); ++it)
  {
    Pet* pet = const_cast<Pet*>(*it);
    AddSceneNode(pet); 
  }   

  // Set up camera
  // TODO Need member var so we can update??
  SceneNodeCamera* snc = new SceneNodeCamera;  
  snc->SetEyePos(Vec3f(0, 0, 200.0f));
  snc->SetLookAtPos(Vec3f(0, 0, 0));
  GetGameSceneGraph()->SetCamera(snc);
}
}
