#include <Screen.h>
#include <DegRad.h>
#include "GSLevelComplete.h"
#include "MySceneGraph.h"
#include "Game.h"
#include "GSLoadLevel.h"
#include "LevelManager.h"
#include "Timer.h"
#include "Pet.h"

namespace Amju
{
const char* GSLevelComplete::NAME = "level-complete";

GSLevelComplete::GSLevelComplete()
{
  m_timer = 0;
}

void SetObjPos(WWGameObject* obj, float angle)
{
  const float RADIUS = 80.0f;
  Vec3f pos(cos(angle) * RADIUS, sin(angle) * RADIUS, 0);
  obj->SetPos(pos);  
  obj->RecalcAABB();

  Matrix mat;
  mat.RotateY(DegToRad(angle)); // TODO
  mat.TranslateKeepRotation(pos);
  obj->GetSceneNode()->SetLocalTransform(mat);
}


void GSLevelComplete::Update()
{
  GetGameSceneGraph()->Update();

  float dt = TheTimer::Instance()->GetDt();

  // Circle of positions - also set y coord for sprial
  static float angle = 0; // increases per frame
  angle += DegToRad(90.0f) * dt;

  float a = angle;
  SetObjPos(m_player, a);

  const Pets& pets = m_player->GetPets();
  for (auto it = pets.begin(); it != pets.end(); ++it)
  {
    a += DegToRad(30.0f); // TODO
    Pet* pet = const_cast<Pet*>(*it);
    SetObjPos(pet, a);
  }   

  // Update scene nodes
  //TheGame::Instance()->UpdateGameObjects();

  // Inc timer, go to next state
  m_timer += TheTimer::Instance()->GetDt();
  if (m_timer > 50.0f) // TODO CONFIG
  {
    // Increment level number done by "Exit" object
    TheGame::Instance()->SetCurrentState(TheGSLoadLevel::Instance());
  }
}

void GSLevelComplete::Draw2d()
{
}

void GSLevelComplete::Draw()
{
  AmjuGL::SetMatrixMode(AmjuGL::AMJU_PROJECTION_MATRIX);
  AmjuGL::SetIdentity();
  const float FOVY = 60.0f;
  const float NEAR = 1.0f; 
  const float FAR = 3000.0f;
  float aspect = (float)Screen::X() / (float)Screen::Y();
  AmjuGL::SetPerspectiveProjection(FOVY, aspect, NEAR, FAR);

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();

  // Draw player and any pets carried
  // Spiral motion?
  GetGameSceneGraph()->Draw();
}

void GSLevelComplete::OnDeactive()
{
  GameState::OnDeactive();
  m_player = 0; // no need to retain player any more
  TheLevelManager::Instance()->Clear();
}

void GSLevelComplete::OnActive()
{
  GameState::OnActive();
  // Don't kill game objects yet, we are displaying them!
  m_timer = 0;

std::cout << "Showing level complete state...\n";

  // Show player and pets only
  GetGameSceneGraph()->Clear(); // ?
  GetGameSceneGraph()->SetRootNode(SceneGraph::AMJU_OPAQUE, new SceneNode);

  // Add scene nodes for player and carried pets
  Assert(m_player);
  m_player->AddSceneNode();
  m_player->SetPos(Vec3f());

  const Pets& pets = m_player->GetPets();
  for (auto it = pets.begin(); it != pets.end(); ++it)
  {
    Pet* pet = const_cast<Pet*>(*it);
    pet->AddSceneNode(); 
  }   

  // Set up camera
  // TODO Need member var so we can update??
  SceneNodeCamera* snc = new SceneNodeCamera;  
  snc->SetEyePos(Vec3f(0, 0, -200.0f));
  snc->SetLookAtPos(Vec3f(0, 0, 0));
  GetGameSceneGraph()->SetCamera(snc);
}
}
