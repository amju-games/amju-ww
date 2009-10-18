#include "EditViewport.h"
#include "Font.h"

namespace Amju
{
EditViewport::EditViewport(int id, int x, int y, int w, int h) : 
  Viewport(id, x, y, w, h)
{
}

void EditViewport::Draw2d()
{
  static Font* font = 
    (Font*)TheResourceManager::Instance()->GetRes("font2d/arial-font.font");
  Assert(font);

//  font->Print(0, 0, "Edit mode");
}
}

