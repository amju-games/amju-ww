#include "Viewport.h"
#include "MySceneGraph.h"
#include "AmjuGL.h"
#include "GuiImage.h"
#include "PlayerInfo.h"
#include "PlayerInfoKey.h"
#include "Camera.h"

namespace Amju
{
Viewport::Viewport(int id, int x, int y, int w, int h) : 
  m_id(id), m_x(x), m_y(y), m_w(w), m_h(h)
{
  m_pCamera = 0;
  m_aspect = (float)w / (float)h;
}

void Viewport::Draw()
{
  AmjuGL::Viewport(m_x, m_y, m_w, m_h);

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_PROJECTION_MATRIX);
  AmjuGL::SetIdentity();
  const float FOVY = 60.0f;
  const float NEAR = 1.0f; 
  const float FAR = 3000.0f;
  AmjuGL::SetPerspectiveProjection(FOVY, m_aspect, NEAR, FAR);

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();

  GetGameSceneGraph()->Draw();
}

void Viewport::Draw2d()
{
  AmjuGL::PushMatrix();

  // Translate - depends on ID and total number of Viewports
  if (m_id == 1)
  {
    // Right-hand viewport of two, so translate half screen width
    AmjuGL::Translate(1.0f, 0, 0);
  }

  // Life image
  static GuiImage image;
  static bool first = true;
  if (first)
  {
    first = false;
    image.OpenAndLoad("heart-gui.txt");
  }
  // TODO Lives, score, level ? Other stats, objective text, tutorial etc
  int lives = ThePlayerInfoManager::Instance()->GetPlayerInfo(m_id)->
    GetInt(PlayerInfoKey::LIVES);

  for (int i = 0; i < lives; i++)
  {
    image.Draw();
    AmjuGL::Translate(0.15f, 0, 0); // TODO CONFIG
  }

  AmjuGL::PopMatrix();
}

void Viewport::SetCamera(Camera* pCam)
{
  m_pCamera = pCam;
  Assert(m_pCamera);
  m_pCamera->SetAsSceneGraphCamera();
}

Viewport* ViewportManager::GetViewport(int vpNum)
{
  if (vpNum >= (int)m_viewports.size())
  {
    return 0;
  }

  return m_viewports[vpNum];
}

void ViewportManager::ClearViewports()
{
  m_viewports.clear();
}

void ViewportManager::AddViewport(Viewport* v)
{
  m_viewports.push_back(v);
}

int ViewportManager::GetNumViewports() const
{
  return m_viewports.size();
}
}
