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
}

void GSPetBonus::ShowPet()
{
  if (!m_pets.empty())
  {
    Pet* pet = m_pets.front();
std::cout << "Showing pet " << pet->GetId() << "\n";

    float x = (m_petNum % 4) * 100.0f - 150.0f;
    float y = -(m_petNum / 4) * 100.0f; 
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
    Score::PlayerNum pn = (Score::PlayerNum)m_player->GetPlayerId();
    Score::AddToScore(pn, 100); // TODO accumulator
  }
}

void GSPetBonus::OnActive()
{
  GSText::OnActive();

  m_petNum = 0;
  GetGameSceneGraph()->Clear(); 
  GetGameSceneGraph()->SetRootNode(SceneGraph::AMJU_OPAQUE, new SceneNode);

  Assert(m_player);
  m_pets = m_player->GetPets();
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

    if (m_pets.empty())
    {
      // Go to load level state (or level map state???)
      TheGame::Instance()->SetCurrentState(TheGSLoadLevel::Instance());
    }
    else
    {
      m_pets.pop_front();
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
  AmjuGL::Enable(AmjuGL::AMJU_LIGHTING);
  AmjuGL::DrawLighting(
    AmjuGL::LightColour(0, 0, 0),
    AmjuGL::LightColour(0.2f, 0.2f, 0.2f), // Ambient light colour
    AmjuGL::LightColour(1, 1, 1), // Diffuse light colour
    AmjuGL::LightColour(1, 1, 1),
    AmjuGL::Vec3(1, 1, 1)); // Light direction

  GetGameSceneGraph()->Draw();
}

}
