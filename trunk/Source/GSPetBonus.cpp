#include <Game.h>
#include <Screen.h>
#include <Timer.h>
#include <DegRad.h>
#include "GSPetBonus.h"
#include "GSLoadLevel.h"
#include "Hud.h"
#include "MySceneGraph.h"
#include "Pet.h"
#include "Score.h"

namespace Amju
{
const char* GSPetBonus::NAME = "pet-bonus";

GSPetBonus::GSPetBonus()
{
  m_petNum = 0;
  m_scoreInc = 0;
}

void GSPetBonus::ShowPet()
{
  if (!m_pets.empty())
  {
    Pet* pet = m_pets[m_petNum];
std::cout << "Showing pet " << pet->GetId() << "\n";

    float x = ((float)m_petNum - (float)(m_pets.size() - 1) / 2.0f) * 50.0f;
    float y = 0; //-(m_petNum / 4) * 100.0f; 
    m_petNum++;

    Vec3f pos = Vec3f(x, y, 0);
    pet->SetPos(pos);
    pet->RecalcAABB();

    SceneNode* sn = pet->GetSceneNode();
    Matrix m;
    m.SetIdentity();
    m.Translate(pos);
    sn->SetLocalTransform(m);
    sn->SetVisible(true);
    GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
      AddChild(sn);

    // TODO Sound
//    PlayWav("");
    PlayerNum pn = (PlayerNum)m_player->GetPlayerId();
    TheScores::Instance()->AddToScore(pn, m_scoreInc); 
    m_scoreInc *= 2;
  }
}

void GSPetBonus::OnActive()
{
  GSText::OnActive();

  m_petNum = 0;
  m_scoreInc = 100;
  GetGameSceneGraph()->Clear(); 
  GetGameSceneGraph()->SetRootNode(SceneGraph::AMJU_OPAQUE, new SceneNode);

  Assert(m_player);
  // Copy list into vector
  const Pets& pets = m_player->GetPets();
  m_pets.assign(pets.begin(), pets.end());
  ShowPet();
}

void GSPetBonus::Update()
{
  float dt = TheTimer::Instance()->GetDt();
  m_timer += dt;

  if (m_timer < 1.0f)
  {
    // Rotate current pet
/*
    SceneNode* sn = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
     
    static float angle = 0;
    angle += dt * 90.0f; // TODO CONFIG 
    Matrix mat;
    mat.RotateY(DegToRad(angle)); 
//    mat.TranslateKeepRotation(pos);
    sn->SetLocalTransform(mat);
*/
  }
  else
  {
    m_timer = 0;

    if (m_petNum >= (int)m_pets.size())
    {
      // Go to load level state (or level map state???)
      TheGame::Instance()->SetCurrentState(TheGSLoadLevel::Instance());
    }
    else
    {
      ShowPet();
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
}

}
