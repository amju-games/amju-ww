#include <GuiRect.h>
#include <Screen.h>
#include "EditViewport.h"
#include "MySceneGraph.h"
#include "EditModeCamera.h"

namespace Amju
{
static int s_activeId = 0;

bool EditViewport::IsActive() const
{
  return m_id == s_activeId;
}

void EditViewport::SetActiveId(int activeViewportId)
{
  s_activeId = activeViewportId;
}

EditViewport::EditViewport(int id, float x, float y, float w, float h, const std::string& name) : 
  Viewport(id, x, y, w, h), m_name(name)
{
  static const float W = 0.02f;
  static const float H = 0.03f;
  // Left
  m_rect[0].SetLocalPos(Vec2f(-1, 1)); 
  m_rect[0].SetSize(Vec2f(W, 2.0f));
  // Right
  m_rect[1].SetLocalPos(Vec2f(1 - W, 1));
  m_rect[1].SetSize(Vec2f(W, 2.0f));
  // Up
  m_rect[2].SetLocalPos(Vec2f(-1, 1));
  m_rect[2].SetSize(Vec2f(2.0f, H));
  // Down
  m_rect[3].SetLocalPos(Vec2f(-1, -1 + H));
  m_rect[3].SetSize(Vec2f(2.0f, H));
}

void EditViewport::Draw()
{
  Assert(m_cam);

  EditModeCamera* emc = dynamic_cast<EditModeCamera*>(m_cam.GetPtr());
  Assert(emc);
  emc->SetIsActive(IsActive());

  SceneGraph* graph = GetGameSceneGraph();
  graph->SetCamera(m_cam);

  float x = (float)Screen::X();
  float y = (float)Screen::Y();
  AmjuGL::Viewport((int)(m_x * x), (int)(m_y * y), (int)(m_w * x), (int)(m_h * y));

  graph->Draw();
}

void EditViewport::Draw2d()
{
  float x = (float)Screen::X();
  float y = (float)Screen::Y();
  AmjuGL::Viewport((int)(m_x * x), (int)(m_y * y), (int)(m_w * x), (int)(m_h * y));

  // Draw border
  Colour c = IsActive() ? Colour(1, 0, 0, 1) : Colour(0, 0, 0, 1);
  for (int i = 0; i < 4; i++)
  {
    m_rect[i].SetColour(c);
    m_rect[i].Draw();
  }

  std::string str = m_name;

  m_text.SetLocalPos(Vec2f(-1, 0.9f));
  m_text.SetSize(Vec2f(0.5f, 0.1f));
  m_text.SetText(str);
  m_text.SetFgCol(Colour(1, 1, 1, 1));
//  m_text.SetDrawBg(true);
  m_text.Draw();
}
}

