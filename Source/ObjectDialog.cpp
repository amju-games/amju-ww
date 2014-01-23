#include <Game.h>
#include <GuiListBox.h>
#include "WWGameObject.h"
#include "ObjectDialog.h"
#include "Describe.h"

namespace Amju
{
static void OnFinished(Dialog* dlg)
{
}

ObjectDialog::ObjectDialog()
{
  SetFinishCallback(OnFinished);
  SetTitle("Objects");
  m_guiFilename = "object-dialog-gui.txt";
}

void ObjectDialog::OnActive() 
{
  Dialog::OnActive();

  GuiListBox* glb = dynamic_cast<GuiListBox*>(GetElementByName(m_gui, "object-list-box"));
  Assert(glb);
  GuiList* gl = glb->GetList();
  // TODO click callbacks

  GameObjects* objs = TheGame::Instance()->GetGameObjects();

  float y = 0;
  for (auto it = objs->begin(); it != objs->end(); ++it)
  {
    //int id = it->first;
    PGameObject ob = it->second;
    std::string str = Describe(ob);
    
    GuiText* text = new GuiText;
    text->SetSize(Vec2f(1.0f, 0.1f));
    text->SetJust(GuiText::AMJU_JUST_LEFT);
    text->SetText(str);
    text->SetLocalPos(Vec2f(0, y));
    y -= 0.1f;

    gl->AddChild(text);
  } 
}

void ObjectDialog::GetDataFromGui()
{
}

void ObjectDialog::SetDataToGui() 
{
}

}
