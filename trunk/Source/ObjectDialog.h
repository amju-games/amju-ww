#pragma once

#include "ModalDialog.h"

namespace Amju
{
class ObjectDialog : public Dialog
{
public:
  virtual void OnActive() override;
  virtual void GetDataFromGui() override;
  virtual void SetDataToGui() override;

};
}
