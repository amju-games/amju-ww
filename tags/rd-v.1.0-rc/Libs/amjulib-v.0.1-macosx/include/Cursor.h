#ifndef CURSOR_H
#define CURSOR_H

#include <TriList.h>
#include "EventListener.h"
#include "Vec2.h"
#include "Texture.h"

namespace Amju
{
class Cursor : public EventListener
{
public:
  Cursor();
  
  virtual bool OnCursorEvent(const CursorEvent& ce);  
  virtual bool OnRotationEvent(const RotationEvent&);
  
  bool Load(int id, const Vec2f& hotspot);
  void Draw();

  const Vec2f& GetPos() const;

private:
  PTexture m_pTex;
  float m_rot; // rotation about z
  Vec2f m_pos;
  Vec2f m_hotspot; // offset to m_pos so image hotspot is under mouse cursor. We rotate about this point.
  //AmjuGL::Tris m_tris;
  RCPtr<TriListStatic> m_triList;
  int m_id;
  bool m_isActive;
};
} 

#endif
