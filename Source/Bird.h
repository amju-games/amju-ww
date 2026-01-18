#pragma once

#include "Npc.h"

namespace Amju
{
class Bird : public Npc
{
public:
  static const char* NAME;
  virtual const char* GetTypeName() const;
  virtual WWGameObject* Clone() override;
  virtual bool Load(File*) override;
  virtual bool Save(File*) override;
  virtual void Update() override;
};
}