#pragma once

#include <SceneNode.h>

namespace Amju
{
// Scene Node type for selected object
// Decorates the scene node for the selected object
class SelectedNode : public SceneNode
{
public:
  SelectedNode();

  virtual void BeforeDraw() override;
  virtual void AfterDraw() override;

  void SetSel(bool);

private:
  bool m_isSelected;
};


}
