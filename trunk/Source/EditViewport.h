#ifndef EDIT_VIEWPORT_H
#define EDIT_VIEWPORT_H

#include "Viewport.h"

namespace Amju
{
class EditViewport : public Viewport
{
public:
  EditViewport(int id, int x, int y, int w, int h);
  virtual void Draw2d();
};
}

#endif
