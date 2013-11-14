#include <Game.h>
#include <DrawAABB.h>
#include "Viewport.h"
#include "MySceneGraph.h"
#include "AmjuGL.h"
#include "GuiImage.h"
#include "Camera.h"
#include "GSLoadLevel.h"

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

  const float ASPECT = 1.5f; // Always show the same amount of the world,
    // but distorted if viewport does not have this aspect ratio

  AmjuGL::SetPerspectiveProjection(FOVY, ASPECT, NEAR, FAR);

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();

  AmjuGL::PushMatrix();
  AmjuGL::Enable(AmjuGL::AMJU_LIGHTING);
  AmjuGL::DrawLighting(
    AmjuGL::LightColour(0, 0, 0),
    AmjuGL::LightColour(0.2f, 0.2f, 0.2f), // Ambient light colour
    AmjuGL::LightColour(1, 1, 1), // Diffuse light colour
    AmjuGL::LightColour(1, 1, 1),
    AmjuGL::Vec3(1, 1, 1)); // Light direction

  if (TheGSLoadLevel::Instance()->GetGameMode() != AMJU_EDIT_MODE)
  {
    GetCamera()->SetAsSceneGraphCamera();
  }
  GetGameSceneGraph()->Draw();
  AmjuGL::PopMatrix();

#ifdef DRAW_AABB_DEBUG
  // Draw AABBs 
  AmjuGL::PushMatrix();
  GetGameSceneGraph()->GetCamera()->Draw();
  AmjuGL::PushAttrib(AmjuGL::AMJU_TEXTURE_2D);
  AmjuGL::Disable(AmjuGL::AMJU_TEXTURE_2D);
  PushColour();
  AmjuGL::SetColour(Colour(0, 0, 0, 1));
  
  GameObjects* gos = TheGame::Instance()->GetGameObjects();
  for (auto it = gos->begin(); it != gos->end(); ++it)
  {
    GameObject* go = it->second;
    DrawAABB(go->GetAABB());
  }
  PopColour();
  AmjuGL::PopAttrib();
  AmjuGL::PopMatrix();
#endif
}

void Viewport::Draw2d()
{
}

void Viewport::SetCamera(Camera* pCam)
{
  m_pCamera = pCam;
  Assert(m_pCamera);
}

Camera* Viewport::GetCamera()
{
  return m_pCamera;
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
