#ifndef VIEWPORT_H
#define VIEWPORT_H

#include "RCPtr.h"
#include "Rect.h"
#include "Singleton.h"

namespace Amju
{
class SceneNode;
class WWCamera;

// Shows viewport for one player - for split screen multiplayer, there would
// be several viewports. For single player, there is one viewport which 
// fills the screen.
class Viewport : public RefCounted
{
public:
  Viewport(int id, float x, float y, float w, float h);
  virtual ~Viewport() {}

  virtual void Draw();
  virtual void Draw2d();

  void SetCamera(WWCamera*);
  WWCamera* GetCamera();

protected:
  // Target for camera to look at
  // (Not Game Object ID ?)
  //SceneNode* m_pCameraTarget;
  WWCamera* m_pCamera;
  int m_id;
  float m_x, m_y, m_w, m_h;
  float m_aspect;
};

typedef RCPtr<Viewport> PViewport;

// Store viewports here, not in a GameState, so we can have
//  different GameState classes which use the viewports.
class ViewportManager : public NonCopyable
{
public:
  void ClearViewports();
  void AddViewport(Viewport* v);
  Viewport* GetViewport(int vpNum);
  int GetNumViewports() const;

private:
  ViewportManager() {}
  friend class Singleton<ViewportManager>;

  typedef std::vector<PViewport> Viewports;
  Viewports m_viewports;
};

typedef Singleton<ViewportManager> TheViewportManager;
}

#endif

