#include <Game.h>
#include <CollisionManager.h>
#include <Timer.h>
#include "MySceneGraph.h"
#include "ShadowManager.h"
#include "GSAttract.h"
#include "GSTitle.h"

namespace Amju
{
void GSAttract::Draw2d()
{
}

void GSAttract::OnActive()
{
  GSMain::OnActive();
  m_timer = 0;
  // Hide GUI elements
}

void GSAttract::Update()
{
  TheGame::Instance()->UpdateGameObjects();
  TheCollisionManager::Instance()->Update();
  GetGameSceneGraph()->Update();
  TheShadowManager::Instance()->Update();

  float dt = TheTimer::Instance()->GetDt();
  m_timer += dt;
  if (m_timer > 10.f) // TODO
  {
    TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());
  }
}
}
