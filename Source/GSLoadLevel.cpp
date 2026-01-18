#include <Game.h>
#include <StringUtils.h>
#include <GuiButton.h>
#include <SoundManager.h>
#include "GSLoadLevel.h"
#include "GSMain.h"
#include "GSMainEdit.h"
#include "GSAttract.h"
#include "PowerUp.h"
#include "MySceneGraph.h"
#include "Timer.h"
#include "OnFloor.h"
#include "GameObjectFactory.h"
#include "Camera.h"
#include "ResourceManager.h"
#include "LevelManager.h"
#include "Hud.h"
#include "ShadowManager.h"
#include "GameMode.h"
#include "WWLoadGui.h"
#include "PlayWav.h"
#include "Depth.h"
#include "ProcGen.h"

namespace Amju
{
class CommandGo : public GuiCommand
{
  virtual bool Do()
  {
    if (IsEditMode())
    {
      TheGame::Instance()->SetCurrentState(TheGSMainEdit::Instance());
    }
    else
    {
      PlayWav("gong");
      TheGSLoadLevel::Instance()->GoToNewState(TheGSMain::Instance());
    }
    return false; //no undo
  }
};

GSLoadLevel::GSLoadLevel()
{
  m_maxBarX = 0;
  m_numObjects = 0;
  m_currentObj = 0;
}

void GSLoadLevel::Draw2d()
{
  GSText::Draw2d();
  TheHud::Instance()->Draw();
}

void GSLoadLevel::OnActive()
{
  GSText::OnActive();

  TheSoundManager::Instance()->PlaySong("sound/piano.it");
  PlayWav("battle003");

  CreateText("level  " + ToString(TheLevelManager::Instance()->GetLevelId()));
  //CreateText("abcdefgh\nijklmnop\nqrstuvwxyz\n!1234567890");

  m_timer = 0;

  m_gui = WWLoadGui("loadlevel-gui.txt");
  Assert(m_gui);
  GuiElement* bar = m_gui->GetElementByName("bar");
  m_maxBarX = bar->GetSize().x;

  // Hide GO button until loaded
  GuiButton* go = (GuiButton*)m_gui->GetElementByName("go-button");
  go->SetIsFocusButton(true);
  go->SetShowIfFocus(true);
  go->SetVisible(false);
  go->SetCommand(new CommandGo);

  TheShadowManager::Instance()->Clear();

  StartLoad();
}

void GSLoadLevel::OnDeactive()
{
  GSText::OnDeactive();
  m_gui = 0; // should remove itself as a listener
}

void GSLoadLevel::StartLoad()
{
  // Create a root for the game scene graph
  GetGameSceneGraph()->SetRootNode(SceneGraph::AMJU_OPAQUE, new SceneNode);

  LevelManager* lm = TheLevelManager::Instance();
  // If already open, we have opened the file in Edit mode
  if (!lm->IsOpen())
  {
    lm->Open();
  }

  m_numObjects = TheLevelManager::Instance()->GetNumObjects();
  m_currentObj = 0;
}

void GSLoadLevel::LoadOneObject()
{
  TheLevelManager::Instance()->LoadOneObject();
}

void GSLoadLevel::Update()
{
  GSText::Update();

  // Wait for graphics to stop moving -- loading ruins the effect
  static const float WAIT_TIME = 1.0f; // TODO

  if (m_timer > WAIT_TIME && m_currentObj < m_numObjects)
  {
    LoadOneObject();
    ++m_currentObj;

    // If done, turn off prog bar and turn on GO button
    // TODO Don't do this for attract mode - go directly to level
    if (m_currentObj == m_numObjects)
    {
      TheLevelManager::Instance()->Close();
      ResetDepth();
      TheProcGen::Instance()->Reset();
      ThePowerUpManager::Instance()->ResetPowerUps();
      TheHud::Instance()->SetLevel(TheLevelManager::Instance()->GetLevelId());

      if (IsAttractMode())
      {
        TheGame::Instance()->SetCurrentState(TheGSAttract::Instance());
      }
      else
      {
         m_gui->GetElementByName("go-button")->SetVisible(true);
         m_gui->GetElementByName("progressbar")->SetVisible(false);
      }
    }
  }
  
  GuiElement* bar = m_gui->GetElementByName("bar");
  Vec2f s = bar->GetSize();
  float barSize = (float)m_currentObj / (float)m_numObjects;
  if (barSize > 1.0f)
  {
    barSize = 1.0f;
  }
  s.x = barSize * m_maxBarX;
  bar->SetSize(s);
}
}
