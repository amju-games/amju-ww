#include <Game.h>
#include <Screen.h>
#include <Timer.h>
#include <DegRad.h>
#include <GuiText.h>
#include <SoundManager.h>
#include "GSPetBonus.h"
#include "GSLoadLevel.h"
#include "Hud.h"
#include "MySceneGraph.h"
#include "Pet.h"
#include "Score.h"
#include "BonusParticleEffect.h"
#include "WWLoadGui.h"
#include "PlayWav.h"

namespace Amju
{
const char* GSPetBonus::NAME = "pet-bonus";

GSPetBonus::GSPetBonus()
{
  m_petNum = 0;
  m_scoreInc = 0;
  m_bonus = 0;
  m_bonusPortion = 0;
  m_state = WAITING;
}

void GSPetBonus::ShowPet()
{
  if (!m_pets.empty())
  {
    Pet* pet = m_pets[m_petNum];
    pet->ResetEatenState();

std::cout << "Showing pet " << pet->GetId() << "\n";

    float x = ((float)m_petNum - (float)(m_pets.size() - 1) / 2.0f) * 50.0f;
    float y = -300; //; //-(m_petNum / 4) * 100.0f; 
    float z = -100;
    m_petNum++;

    Vec3f pos = Vec3f(x, y, z);
    pet->SetPos(pos);
    pet->RecalcAABB();

    SceneNode* sn = pet->GetSceneNode();
    Matrix m;
    m.SetIdentity();
    m.Translate(pos);
    sn->SetLocalTransform(m);
    sn->SetVisible(true);
    GetTextSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
      AddChild(sn);

    BonusParticleEffect* pe = new BonusParticleEffect;
    pe->Set("sparkle1.png", 5.0f, 30, 6.0f, -1000);
//    pe->SetLocalTransform(m);
    pe->Start();
    sn->AddChild(pe);

    PlayWav("cashreg");
//    PlayerNum pn = (PlayerNum)m_player->GetPlayerId();
//    TheScores::Instance()->AddToScore(pn, m_scoreInc); 
    m_bonus = m_scoreInc;
    // Decide based on bonus size
    m_bonusPortion = m_bonus / 20;
    m_scoreInc *= 2;
  }
}

void GSPetBonus::OnActive()
{
  GSText::OnActive();

  PlayWav("battle003");
  TheSoundManager::Instance()->PlaySong("sound/piano.it");

  m_state = WAITING;

  m_gui = WWLoadGui("pet-bonus-gui.txt");
  Assert(m_gui);

  m_petNum = 0;
  m_scoreInc = 100;

  //GetGameSceneGraph()->Clear(); 
  //GetGameSceneGraph()->SetRootNode(SceneGraph::AMJU_OPAQUE, new SceneNode);
  CreateText("");

  Assert(m_player);
  // Copy list into vector
  const PetList& pets = m_player->GetPets();
  m_pets.assign(pets.begin(), pets.end());
}

void GSPetBonus::Update()
{
  GSText::Update();
 
//  float dt = TheTimer::Instance()->GetDt();
//  m_timer += dt; // in base class impl

  if (m_state == FINISHED)
  {
    if (m_timer > 3.0f) // TODO CONFIG
    {
      // Go to load level state (or level map state???)
      TheGame::Instance()->SetCurrentState(TheGSLoadLevel::Instance());
    }
  }
  else if (m_state == WAITING)
  {
    static const float MAX_PET_TIME = 2.0f; // TDOO CONFIG
    if (m_timer < MAX_PET_TIME)
    {
      return;
    }
    else
    {
      m_timer = 0;
      m_state = COUNTING;
      ShowPet();
    }
  }
  else if (m_state == COUNTING)
  {
    static const float MAX_PORTION_TIME = 0.1f; // TODO CONFIG
    if (m_timer > MAX_PORTION_TIME)
    {
      m_timer = 0;
      if (m_bonus == 0)
      {
        if (m_petNum >= (int)m_pets.size())
        {
          m_state = FINISHED;
        }
        else
        {
          m_state = WAITING;
        }
      }
      else
      {
        Assert(m_bonus > 0);
        m_bonus -= m_bonusPortion;
        PlayerNum pn = (PlayerNum)m_player->GetPlayerId();
        TheScores::Instance()->AddToScore(pn, m_bonusPortion); 
//      TheHud::Instance()->UpdateScores();

        GuiText* bonus = (GuiText*)m_gui->GetElementByName("score-text");
        bonus->SetText(ToString(m_bonus));
      }
    }
  }
}

void GSPetBonus::Draw2d()
{
  GSText::Draw2d();
  TheHud::Instance()->Draw();
}

void GSPetBonus::Draw()
{
  GSText::Draw();

/*
  AmjuGL::SetMatrixMode(AmjuGL::AMJU_PROJECTION_MATRIX);
  AmjuGL::SetIdentity();
  const float FOVY = 60.0f;
  const float NEAR = 1.0f;
  const float FAR = 1000.0f;
  static const float aspect = (float)Screen::X() / (float)Screen::Y();
  AmjuGL::SetPerspectiveProjection(FOVY, aspect, NEAR, FAR);

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();
  AmjuGL::LookAt(0, 100.0f, 200.0f,   0, 50.0f, 0.0f,  0, 1.0f, 0);

  // TODO Lighting node
  AmjuGL::Disable(AmjuGL::AMJU_LIGHTING);

  GetGameSceneGraph()->Draw();
*/
}

}
