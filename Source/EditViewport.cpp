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
  if (IsActive())
  {
    static GuiRect r[4];
    // Left
    r[0].SetLocalPos(Vec2f(-1, 1)); 
    r[0].SetSize(Vec2f(0.05f, 2.0f));
    // Right
    r[1].SetLocalPos(Vec2f(0.95f, 1));
    r[1].SetSize(Vec2f(0.05f, 2.0f));
    // Up
    r[2].SetLocalPos(Vec2f(-1, 1));
    r[2].SetSize(Vec2f(2.0f, 0.05f));
    // Down
    r[3].SetLocalPos(Vec2f(-1, -0.95f));
    r[3].SetSize(Vec2f(2.0f, 0.05f));

    for (int i = 0; i < 4; i++)
    {
      r[i].SetColour(Colour(1, 1, 0, 1));
      r[i].Draw();
    }
  }

  std::string str = m_name;
  if (IsActive())
  {
    str += " (active)";
  }
  m_text.SetText(str);
  m_text.SetLocalPos(Vec2f(0, 0));
  m_text.SetSize(Vec2f(0.5f, 0.1f));
//  m_text.SetDrawBg(true);
  m_text.Draw();
}
}

