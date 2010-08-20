#ifndef ANIMATED_H_INCLUDED
#define ANIMATED_H_INCLUDED

#include "SceneNode.h"
#include "Md2Model.h"
#include "Vec3.h"
#include "Shadow.h"

namespace Amju
{
class OnFloorCharacter;

class Animated : public SceneNode
{
public:
  Animated();
  void SetGameObj(OnFloorCharacter* gameObj);

  virtual void Draw();
  virtual void Update();
  void SetAnim(int animId);
  void SetAnim(const std::string& animName);

  bool LoadMd2(const std::string& md2name);
  void SetMd2(Md2Model* model);

protected:
  // No texture data here - we don't know how many textures 

  PMd2Model m_pModel;

  // Game object controlling this scene node
  OnFloorCharacter* m_gameObj;

private:
  int m_anim;
  // TODO Need next anim ?
  int m_frame;
  int m_nextFrame;
  float m_t; // varies from 0..1
};
}

#endif
