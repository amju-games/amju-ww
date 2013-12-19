#include <GuiRect.h>
#include "EditViewport.h"
#include "MySceneGraph.h"

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

EditViewport::EditViewport(int id, int x, int y, int w, int h, const std::string& name) : 
  Viewport(id, x, y, w, h), m_name(name)
{
}

void EditViewport::Draw()
{
  Assert(m_cam);

  SceneGraph* graph = GetGameSceneGraph();
  graph->SetCamera(m_cam);

  AmjuGL::Viewport(m_x, m_y, m_w, m_h);

  graph->Draw();
}

void EditViewport::Draw2d()
{
  AmjuGL::Viewport(m_x, m_y, m_w, m_h);

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

