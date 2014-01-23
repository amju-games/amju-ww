#pragma once

#include "ModalDialog.h"

namespace Amju
{
class ObjectDialog : public Dialog
{
private:
  ObjectDialog();
  friend class Singleton<ObjectDialog>;

public:
  virtual void OnActive() override;
  virtual void GetDataFromGui() override;
  virtual void SetDataToGui() override;

  void OnClickedItem(int item);
  void OnProperties();
  void OnSelect();
  void OnDelete();

protected:
  void Refresh();
  // Get the currently selected game object
  WWGameObject* GetGameObjectSelection();

  // Object IDs, in order they are listed in the list box
  typedef std::vector<int> ObjectIds;
  ObjectIds m_objIds;
};

typedef Singleton<ObjectDialog> TheObjectDialog;
}
