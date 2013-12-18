#include <AmjuGL.h>
#include "EditViewport.h"
#include "Font.h"
#include "MySceneGraph.h"

namespace Amju
{
EditViewport::EditViewport(int id, int x, int y, int w, int h) : 
  Viewport(id, x, y, w, h)
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
  static Font* font = 
    (Font*)TheResourceManager::Instance()->GetRes("font2d/arial-font.font");
  Assert(font);

//  font->Print(0, 0, "Edit mode");
}
}

