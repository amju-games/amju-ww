#pragma once

#include "ModalDialog.h"

namespace Amju
{
// Types for properties
enum ItemType
{
  AMJU_PROP_TEXT,
  AMJU_PROP_FILE,
  AMJU_PROP_INT,
  AMJU_PROP_FLOAT,
  AMJU_PROP_BOOL,
  AMJU_PROP_VEC3
};

class PropertiesDialog : public Dialog
{
public:
  // One item in the dialog
  struct Item : public RefCounted
  {
    Item(const std::string& label, ItemType it) : m_label(label), m_itemType(it)
    {
    }

    virtual GuiComposite* CreateGui() = 0;

    std::string m_label; // displayed in GUI
    ItemType m_itemType; // so we know how to display and change
    // Call back when changed?

    RCPtr<GuiComposite> m_gui;
  };
  typedef RCPtr<Item> PItem;
  typedef std::vector<PItem> Items;

  struct TextItem : public Item
  {
    TextItem(const std::string& label, const std::string& value) : Item(label, AMJU_PROP_TEXT),
      m_value(value)
    {}

    virtual GuiComposite* CreateGui() override;

    void SetValue(const std::string& value);

  protected:
    std::string m_value;
  };

  struct FilenameItem : public TextItem
  {
    FilenameItem(const std::string& label, const std::string& value) : TextItem(label, value)
    {
      m_itemType = AMJU_PROP_FILE;
    }

    virtual GuiComposite* CreateGui() override;
  };

public:
  PropertiesDialog();

  virtual void OnActive() override;
  virtual void GetDataFromGui() override;
  virtual void SetDataToGui() override;

  void Clear();
  void AddItem(PItem);

protected:
  Items m_items;
//  int m_numItems;
};
}
