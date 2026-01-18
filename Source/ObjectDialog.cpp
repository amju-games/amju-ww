#include <Game.h>
#include <GuiListBox.h>
#include "WWGameObject.h"
#include "ObjectDialog.h"
#include "GSMainEdit.h"

namespace Amju
{
static void OnSelect(GuiElement*)
{
  TheObjectDialog::Instance()->OnSelect();
}

static void OnDelete(GuiElement*)
{
  TheObjectDialog::Instance()->OnDelete();
}

static void OnProperties(GuiElement*)
{
  TheObjectDialog::Instance()->OnProperties();
}

static void OnFinished(Dialog* dlg)
{
}

static void OnObjectClicked(GuiList* gl, int selectedIndex)
{

}

ObjectDialog::ObjectDialog()
{
  SetFinishCallback(OnFinished);
  SetTitle("Objects");
  m_guiFilename = "object-dialog-gui.txt";
}

void ObjectDialog::OnClickedItem(int item)
{
}

void ObjectDialog::OnProperties()
{
  WWGameObject* ww = GetGameObjectSelection();
  if (ww)
  {
    TheGSMainEdit::Instance()->ShowPropertiesDlgForObject(ww);
  }
}

void ObjectDialog::OnSelect()
{
  WWGameObject* ww = GetGameObjectSelection();
  if (ww)
  {
    bool alreadySelected = ww->IsSelected();
    TheGSMainEdit::Instance()->SetSelectedObject(ww, !alreadySelected);
  }
}

void ObjectDialog::OnDelete()
{
}

void ObjectDialog::Refresh()
{
  GuiListBox* glb = dynamic_cast<GuiListBox*>(GetElementByName(m_gui, "object-list-box"));
  Assert(glb);
  glb->Clear();

  m_objIds.clear();

  GuiList* gl = glb->GetList();

  GameObjects* objs = TheGame::Instance()->GetGameObjects();

  float y = 0;
  for (auto it = objs->begin(); it != objs->end(); ++it)
  {
    int id = it->first;
    m_objIds.push_back(id);

    PGameObject ob = it->second;
    std::string str = ToString(id) + ": " + ob->GetTypeName();
    
    GuiText* text = new GuiText;
    text->SetSize(Vec2f(1.0f, 0.1f));
    text->SetJust(GuiText::AMJU_JUST_LEFT);
    text->SetText(str);
    text->SetLocalPos(Vec2f(0, y));
    y -= 0.1f;

    gl->AddItem(text);
  } 
}

WWGameObject* ObjectDialog::GetGameObjectSelection()
{
  GuiListBox* glb = dynamic_cast<GuiListBox*>(GetElementByName(m_gui, "object-list-box"));
  Assert(glb);
  GuiList* gl = glb->GetList();
  Assert(gl);
  int sel = gl->GetSelectedItem();
  if (sel == -1)
  {
    return 0;
  }
  if (sel >= (int)m_objIds.size())
  {
    Assert(0);
    return 0;
  }
  int id = m_objIds[sel];
  GameObject* go = TheGame::Instance()->GetGameObject(id);
  Assert(go);
  WWGameObject* ww = dynamic_cast<WWGameObject*>(go);
  Assert(ww);
  return ww;
}

void ObjectDialog::OnActive() 
{
  Dialog::OnActive();

  GuiListBox* glb = dynamic_cast<GuiListBox*>(GetElementByName(m_gui, "object-list-box"));
  Assert(glb);
  GuiList* gl = glb->GetList();

  // click callbacks
  gl->SetSingleClickFunc(OnObjectClicked);

  Refresh();

  GetElementByName(m_gui, "select-button")->SetCommand(Amju::OnSelect);
  GetElementByName(m_gui, "properties-button")->SetCommand(Amju::OnProperties);
  GetElementByName(m_gui, "delete-button")->SetCommand(Amju::OnDelete);
}

void ObjectDialog::GetDataFromGui()
{
}

void ObjectDialog::SetDataToGui() 
{
}

}
