#pragma once


#include <Singleton.h>
#include "GSText.h"

namespace Amju 
{
class GSYouGotHiScore : public GSText
{
  GSYouGotHiScore();
  friend class Singleton<GSYouGotHiScore>;

public:
  virtual void Update() override;
  virtual void Draw() override;
  virtual void Draw2d() override;
  virtual void OnActive() override;
  virtual void OnDeactive() override;
  void OnOk();
};
typedef Singleton<GSYouGotHiScore> TheGSYouGotHiScore;
} // namespace

