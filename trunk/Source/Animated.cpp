#include "AmjuFirst.h"
#include "Animated.h"
#include "Timer.h"
#include "AmjuGL.h"
#include "Sign.h"
#include "ResourceManager.h"
#include "ReportError.h"
#include "DrawAABB.h"
#include "OnFloorCharacter.h"
#include "AmjuFinal.h"

namespace Amju
{
Animated::Animated()
{
  m_frame = 0;
  m_nextFrame = 1;
  m_t = 0;
  m_anim = 0;
  m_gameObj = 0;
}

void Animated::SetGameObj(OnFloorCharacter* gameObj)
{
  m_gameObj = gameObj;
}

void Animated::SetAnim(const std::string& animName)
{
  int anim = m_pModel->GetAnimationFromName(animName);
  if (anim == -1)
  {
    std::cout << "No anim '" << animName << "' for animated char.\n";
    return; // no such anim
  }
  SetAnim(anim);
}

void Animated::SetAnim(int anim)
{
  Assert(anim != -1);

  if (anim == m_anim)
  {
    return;
  }

  m_anim = anim;
  // Blend into first frame of new anim
  m_nextFrame = m_pModel->GetStartFrame(m_anim);
}

void Animated::SetMd2(Md2Model* model)
{
  m_pModel = model;
}

bool Animated::LoadMd2(const std::string& md2name)
{
  m_pModel = (Md2Model*)TheResourceManager::Instance()->GetRes(md2name);
  if (!m_pModel)
  {
    ReportError("Failed to load MD2: " + md2name);
    return false;
  }
  return true;
}

void Animated::Draw()
{
  Assert(IsVisible());

  Assert(m_pModel);

  float t = m_t * 10.0f;
  if (t > 1.0f)
  {
    t = 1.0f;
  }
  AmjuGL::PushMatrix();
  AmjuGL::MultMatrix(m_local);
  // TODO Offset Y so feet are at zero
  AmjuGL::Translate(0, 30.0f, 0);
  m_pModel->DrawFrames(m_frame, m_nextFrame, t);
  AmjuGL::PopMatrix();
}

void Animated::Update()
{
  if (!IsVisible())
  {
    return;
  }

  SceneNode::Update();

  Assert(m_pModel);
  float dt = TheTimer::Instance()->GetDt();
  m_t += dt;

  if (m_t > 0.1f) // MD2 frames are 0.1 secs each 
  {
    m_t = 0;
    m_frame = m_nextFrame;

    int startFrame = m_pModel->GetStartFrame(m_anim);
    int size = m_pModel->GetAnimationSize((Md2Model::Animation)m_anim);

    // If next frame is in the same animation, increment to next frame,
    //  or go back to first frame
    if (m_nextFrame >= startFrame && m_nextFrame <= startFrame + size)
    {
      m_nextFrame++;
      if (m_nextFrame >= startFrame + size)
      {
        if (m_pModel->GetDoesActionRepeat(m_anim))
        {
          m_nextFrame = startFrame;
          Assert(m_gameObj);
          m_gameObj->OnAnimRepeat();
        }
        else if (m_pModel->GetDoesActionFreeze(m_anim))
        {
          m_nextFrame--;
          Assert(m_gameObj);
          m_gameObj->OnAnimFreeze();
        }
        else
        {
          // TODO This doesn't work, overwritten by other code
          // Doesn't repeat or freeze - go back to stand
          m_anim = 0;
          m_nextFrame = 0;
          Assert(m_gameObj);
          m_gameObj->OnAnimFinished();
        }
      }
    }
  }
}
}
