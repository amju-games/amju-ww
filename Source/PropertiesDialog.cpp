#include <GuiTextEdit.h>
#include <GuiButton.h>
#include "PropertiesDialog.h"

namespace Amju
{
void PropertiesDialog::TextItem::SetValue(const std::string& value)
{
  m_value = value;
  // Update GUI text
  // TODO - not required?????
}

GuiComposite* PropertiesDialog::TextItem::CreateGui() 
{
  // Create GUI elements
  GuiComposite* comp = new GuiComposite;
  GuiText* label = new GuiText;
  label->SetName("label");
  label->SetFgCol(Colour(1, 1, 1, 1)); // ?
  label->SetTextSize(1.0f);
  label->SetLocalPos(Vec2f(0, -0.05f)); // TODO
  label->SetSize(Vec2f(0.5f, 0.1f));
  label->SetJust(GuiText::AMJU_JUST_LEFT);
  label->SetText(m_label);
  comp->AddChild(label);

  GuiTextEdit* edit = new GuiTextEdit;
  edit->SetName("value");
  edit->SetFgCol(Colour(1, 1, 1, 1)); // ?
  edit->SetBgCol(Colour(0, 0, 0, 1)); // ?
  edit->SetTextSize(1.0f);
  edit->SetLocalPos(Vec2f(0.5f, -0.05f)); // TODO
  edit->SetSize(Vec2f(0.5f, 0.1f));
  edit->SetText(m_value);
  comp->AddChild(edit);

  m_gui = comp;

  return m_gui;
}

static std::string s_lastPath; // TODO

// Special file dialog that knows the properties item to which it relates
class ItemFileDialog : public FileDialog
{
public:
  ItemFileDialog() : m_filenameItem(0) {}
  void SetItem(PropertiesDialog::FilenameItem* filenameItem) { m_filenameItem = filenameItem; }
  PropertiesDialog::FilenameItem* GetItem() { return m_filenameItem; }

private:
  PropertiesDialog::FilenameItem* m_filenameItem;
};

static void OnBrowseDialogClosed(Dialog* dlg)
{
  if (dlg->GetResult() == AMJU_OK)
  {
    ItemFileDialog* ifd = dynamic_cast<ItemFileDialog*>(dlg);
    Assert(ifd);
    // Now call back with change to filename?
    ifd->GetItem()->SetValue(ifd->GetFilePath());
  }
}

class BrowseCommand : public GuiCommand
{
public:
  BrowseCommand(PropertiesDialog::FilenameItem* filenameItem) : m_filenameItem(filenameItem)
  {
  }

  virtual bool Do() override
  {
    static ItemFileDialog s_fileDialog; 

    s_fileDialog.SetItem(m_filenameItem);
    s_fileDialog.SetGuiFilename("gui-file-load-preview-dialog.txt");
    s_fileDialog.SetFinishCallback(OnBrowseDialogClosed);
    s_fileDialog.SetPath("c:\\");
    s_fileDialog.SetTitle("Open File");
    DoModalDialog(&s_fileDialog);

    return false; // not undoable
  };

private:
  PropertiesDialog::FilenameItem* m_filenameItem;
};

GuiComposite* PropertiesDialog::FilenameItem::CreateGui() 
{
  TextItem::CreateGui();

  GuiButton* browseButton = new GuiButton;
  Texture* tex = (Texture*)TheResourceManager::Instance()->GetRes("gui-button-4.png");
  // TODO Set font, size 
  browseButton->SetTexture(tex);
  browseButton->SetLocalPos(Vec2f(1.05f, -0.05f));
  browseButton->SetSize(Vec2f(0.4f, 0.1f));
  browseButton->SetText("Browse...");
  browseButton->SetCommand(new BrowseCommand(this));

  m_gui->AddChild(browseButton);

  return m_gui;
}

PropertiesDialog::PropertiesDialog()
{
  m_guiFilename = "gui-properties.txt";
}

void PropertiesDialog::GetDataFromGui() 
{
}

void PropertiesDialog::SetDataToGui()
{
}

void PropertiesDialog::AddItem(PItem item)
{
  m_items.push_back(item);
}

void PropertiesDialog::Clear()
{
  m_items.clear();
}

void PropertiesDialog::OnActive()
{
  Dialog::OnActive();

  GuiComposite* parent = dynamic_cast<GuiComposite*>(m_gui.GetPtr());
  Assert(parent);

  float y = 0;
  for (auto it = m_items.begin(); it != m_items.end(); ++it)
  {
    PItem item = *it;

    GuiComposite* elem = item->CreateGui();
    elem->SetLocalPos(Vec2f(0, y));
    // Calc Size so we can offset each item vertically 
    elem->SetSizeFromChildren();
    y -= elem->GetSize().y;
    y -= 0.02f; // extra spacing - TODO

    parent->AddChild(elem);
  }
}

}

