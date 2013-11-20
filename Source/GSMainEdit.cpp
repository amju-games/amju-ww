#include <EventPoller.h>
#include <Unproject.h>
#include <ClipLineSegBox.h>
#include <GuiMenu.h>
#include <GameObjectFactory.h>
#include <ConfigFile.h>
#include <Directory.h>
#include <GuiCommandHandler.h>
#include "GSMainEdit.h"
#include "GSTitle.h"
#include "GSLoadLevel.h"
#include "Game.h"
#include "CursorManager.h"
#include "MySceneGraph.h"
#include "EditModeCamera.h"
#include "ModalDialog.h"
#include "LevelManager.h"
#include "LurkMsg.h"
#include "ShadowManager.h"

namespace Amju
{
static FileDialog s_fileDialog; 

static MessageBox s_messageBox;

static const char* LAST_PATH = "last_path";

static std::string s_lastPath = TheGameConfigFile::Instance()->
  GetValue(LAST_PATH, "/Users/jay/projects/amju-ww/Assets/levels/"); // TODO

static int s_unsaved = 0; // number of commands away from save

void SelectedNode::Draw()
{
  if (!m_selNode)
  {
    return;
  }

  // TODO Switch to front face culling
  AmjuGL::PushMatrix();
//  AmjuGL::PushAttrib(AmjuGL::AMJU_LIGHTING | AmjuGL::AMJU_TEXTURE_2D);
//  AmjuGL::Disable(AmjuGL::AMJU_LIGHTING);
//  AmjuGL::Disable(AmjuGL::AMJU_TEXTURE_2D);
  PushColour();
  AmjuGL::SetColour(0, 0, 0); 
  //static const float s = 1.1f;
  //AmjuGL::Scale(s, s, s);

  m_selNode->Draw();

  PopColour();
  AmjuGL::PopMatrix();
//  AmjuGL::PopAttrib();
}

static void OnStart()
{
  TheGSMainEdit::Instance()->OnRunStart();
}

static void OnStop()
{
  TheGSMainEdit::Instance()->OnRunStop();
}
    
static void OnSaveDialogClosed(Dialog* dlg)
{
  FileDialog* fd = dynamic_cast<FileDialog*>(dlg);
  Assert(fd);
  if (fd->GetResult() == (int)AMJU_OK)
  {
    std::string filename = fd->GetFilePath();
    s_lastPath = GetFilePath(filename); // strip filename from end
    TheGameConfigFile::Instance()->Set(LAST_PATH, s_lastPath);

    // File exists? If so, confirm overwrite
    if (FileExists(filename))
    {
std::cout << "Overwrite file check\n";
    }

    // Try to save
std::cout << "File Save: filename/path: " << filename << "\n";    
    if (TheLevelManager::Instance()->SaveLevel(filename))
    {
std::cout << "Saved level OK!\n";
      s_unsaved = 0;
    }
    else
    {
std::cout << "FAILED TO SAVE LEVEL!\n";
    }
  }
  else
  {
std::cout << "File Save cancelled.\n";
  }
}

static void OnSaveLevel()
{
  s_fileDialog.SetGuiFilename("gui-file-save-dialog.txt");
  s_fileDialog.SetFinishCallback(OnSaveDialogClosed);
  s_fileDialog.SetPath(s_lastPath);
  DoModalDialog(&s_fileDialog);
}

static void OnQuitSaveChanges(Dialog* dlg)
{
  if (dlg->GetResult() == AMJU_OK)
  {
    OnSaveLevel();
  }
  else
  {
    // Don't save
    TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());  
  }
}

static void OnQuitEditMode()
{
  // TODO prompt for save if any unsaved changes
  if (s_unsaved)
  {
    s_messageBox.SetFinishCallback(OnQuitSaveChanges);
    s_messageBox.SetMessage("Unsaved changes! Do you want to save?",
      "Quit edit mode");
    DoModalDialog(&s_messageBox); 
  }
  else 
  {
    TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());  
  }
}

static void OnNewSaveChanges(Dialog* dlg)
{
  if (dlg->GetResult() == AMJU_OK)
  {
    OnSaveLevel();
  }
  else
  {
    // Don't save - load boilerplate new level
    // TODO
  }
}

static void OnNewLevel()
{
  // If unsaved changes, go to save dialog
  if (s_unsaved)
  {
    s_messageBox.SetFinishCallback(OnNewSaveChanges);
    s_messageBox.SetMessage("Unsaved changes! Do you want to save?",
      "New level");
    DoModalDialog(&s_messageBox); 
  }

  // Load basic level from glue file
  // TODO
}

static void OnLoadDialogClosed(Dialog* dlg)
{
  FileDialog* fd = dynamic_cast<FileDialog*>(dlg);
  Assert(fd);
  if (fd->GetResult() == (int)AMJU_OK)
  {
    std::string filename = fd->GetFilePath();
    s_lastPath = GetFilePath(filename);
    TheGameConfigFile::Instance()->Set(LAST_PATH, s_lastPath);

    // Try to load
std::cout << "File Load: filename/path: " << filename << "\n";    
 
    // Go to file load state

    LevelManager* lm = TheLevelManager::Instance();
    if (lm->Open(filename))
    {
      TheGame::Instance()->SetCurrentState(TheGSLoadLevel::Instance());
    }
    else
    {
std::cout << "Failed to open level file " << filename << "\n";
    }  
  }
  else
  {
std::cout << "File Load cancelled.\n";
  }
}

static void DoLoadDialog()
{
  s_fileDialog.SetGuiFilename("gui-file-load-dialog.txt");
  s_fileDialog.SetFinishCallback(OnLoadDialogClosed);
  s_fileDialog.SetPath(s_lastPath);
  DoModalDialog(&s_fileDialog);
}

static void OnLoadSaveChanges(Dialog* dlg)
{
  if (dlg->GetResult() == AMJU_OK)
  {
    // Yes/OK - save
    OnSaveLevel();
  }
  else if (dlg->GetResult() == AMJU_NO)
  {
    // Don't save, go to Load dialog
    DoLoadDialog();
  }
  else
  {
    // Cancel: do nothing
  }
}

static void OnLoadLevel()
{
  // If unsaved changes, go to save dialog
  if (s_unsaved)
  {
    s_messageBox.SetFinishCallback(OnLoadSaveChanges);
    s_messageBox.SetMessage("Unsaved changes! Do you want to save?",
      "Load level");
    DoModalDialog(&s_messageBox); 
  }
  else
  {
    DoLoadDialog();
  }
}

void OnUndo()
{
  GuiCommandHandler* gch = TheGuiCommandHandler::Instance();

  if (gch->CanUndo())
  {
    gch->Undo();
    // Not here, this will cause double decrement 
    //m_unsaved--;
  }
  else
  {
std::cout << "Can't undo\n";
  }
}

void OnRedo()
{
  GuiCommandHandler* gch = TheGuiCommandHandler::Instance();

  if (gch->CanRedo())
  {
    gch->Redo();
    // Not here, in the actual commands
    //m_unsaved++;
  }
  else
  {
std::cout << "Can't redo\n";
  }
}

void OnRotate()
{
}

void OnDuplicate()
{
  // Clone currently selected object
  TheGSMainEdit::Instance()->OnDuplicate();
}

void OnDelete()
{
  TheGSMainEdit::Instance()->OnDelete();
}

void OnProperties()
{
}


GSMainEdit::GSMainEdit()
{
  m_playTestMode = false;

  m_isSelecting = false;
  m_selectedObj = 0;
  m_selNode = new SelectedNode; 

  // Set up top menu 
  m_topMenu = new GuiMenu;
  m_topMenu->SetIsVertical(false);
  m_topMenu->SetLocalPos(Vec2f(-1.0f, 1.0f));

  GuiMenu* fileSubmenu = new GuiMenu;
  fileSubmenu->AddChild(new GuiMenuItem("Quit", OnQuitEditMode));
  fileSubmenu->AddChild(new GuiMenuItem("New level", OnNewLevel));
  fileSubmenu->AddChild(new GuiMenuItem("Load level", OnLoadLevel));
  fileSubmenu->AddChild(new GuiMenuItem("Save level", OnSaveLevel));

  GuiMenu* editSubmenu = new GuiMenu;
  editSubmenu->AddChild(new GuiMenuItem("Undo", OnUndo));
  editSubmenu->AddChild(new GuiMenuItem("Redo", OnRedo));

  GuiMenu* newObjSubmenu = new GuiMenu;
  // Get types from Game Obj factory
  std::vector<std::string> names = TheGameObjectFactory::Instance()->GetTypeNames();
  for (unsigned int i = 0; i < names.size(); i++)
  {
    newObjSubmenu->AddChild(new GuiMenuItem(names[i]));
  }

  GuiMenu* runSubmenu = new GuiMenu;
  runSubmenu->AddChild(new GuiMenuItem("Start     ", OnStart));
  runSubmenu->AddChild(new GuiMenuItem("Stop    ", OnStop));

  m_topMenu->AddChild(new GuiNestMenuItem("File    ", fileSubmenu));
  m_topMenu->AddChild(new GuiNestMenuItem("Edit    ", editSubmenu));
  m_topMenu->AddChild(new GuiNestMenuItem("New Object    ", newObjSubmenu));
  m_topMenu->AddChild(new GuiNestMenuItem("Run    ", runSubmenu));

  m_infoText.SetLocalPos(Vec2f(-1, -0.9f));
  m_infoText.SetSize(Vec2f(2, 0.1f));
}

void GSMainEdit::OnRunStart()
{
  m_playTestMode = true;
}

void GSMainEdit::OnRunStop()
{
  m_playTestMode = false;

  // Reset objects to initial state
  GameObjects* objs = TheGame::Instance()->GetGameObjects();
  for (auto it = objs->begin(); it != objs->end(); ++it)
  {
    GameObject* go = it->second;
    WWGameObject* ww = dynamic_cast<WWGameObject*>(go);
    Assert(ww);
    ww->Reset();
  }
}

void GSMainEdit::OnDuplicate()
{
  if (m_selectedObj)
  {
  }
}

class DeleteCommand : public GuiCommand
{
public:
  DeleteCommand(WWGameObject* obj) : m_obj(obj)
  {
  }

  virtual bool Do() override
  {
    m_obj->RemoveFromGame();
    s_unsaved++;
    return true;
  }

  virtual void Undo() override
  {
    m_obj->AddToGame();
    s_unsaved--;
  }

private:
  RCPtr<WWGameObject> m_obj;
};

void GSMainEdit::OnDelete()
{
  if (m_selectedObj)
  {
    // TODO Are you sure? Anyway, this is undoable
    DeleteCommand* dc = new DeleteCommand(m_selectedObj);
    TheGuiCommandHandler::Instance()->DoNewCommand(dc);
  }
}

void GSMainEdit::OnDeactive()
{
  TheEventPoller::Instance()->RemoveListener(m_topMenu);
}

static EditModeCamera* GetCamera()
{
  SceneNodeCamera* c = GetGameSceneGraph()->GetCamera();
  return dynamic_cast<EditModeCamera*>(c);
}

void GSMainEdit::OnActive()
{
  m_selectedObj = 0;
  m_isSelecting = false;

  GSMain::OnActive();
  // Show bounding boxes - TODO don't use this, draw object AABBs
  SceneNode::SetGlobalShowAABB(true);

  GetGameSceneGraph()->SetCamera(new EditModeCamera);
  
  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  Assert(root);

  TheEventPoller::Instance()->AddListener(m_topMenu);

  // Initial option is to load a block
  /*
  GuiMenu* childMenu = new GuiMenu;
  childMenu->SetName("Child menu");
  childMenu->AddChild(new GuiMenuItem("good"));
  childMenu->AddChild(new GuiMenuItem("Lord"));
  childMenu->AddChild(new GuiMenuItem("this"));
  childMenu->AddChild(new GuiMenuItem("seems"));
  childMenu->AddChild(new GuiMenuItem("to"));
  childMenu->AddChild(new GuiMenuItem("work"));
 

  m_contextMenu->AddChild(new GuiMenuItem("New block"));
  m_contextMenu->AddChild(new GuiMenuItem("Load block..."));

  m_contextMenu->AddChild(new GuiMenuItem("I am"));
  m_contextMenu->AddChild(new GuiMenuItem("some text"));
  m_contextMenu->AddChild(new GuiNestMenuItem("I R Nested!", childMenu));

  m_contextMenu->SetName("Parent menu");
  
  */
  m_contextMenu = new ContextMenu;
  m_contextMenu->SetVisible(false);
  TheEventPoller::Instance()->AddListener(m_contextMenu);

  // Update once to transfer position info to scene nodes etc.
//  GSMain::Update();
  TheGame::Instance()->UpdateGameObjects();
}

void GSMainEdit::Update()
{
  if (m_playTestMode)
  {
    GSMain::Update();
  }
  else
  {
    // Don't update game objects; don't check collisions
    // Do Update all bounding boxes
    GameObjects* gos = TheGame::Instance()->GetGameObjects();
    for (GameObjects::iterator it = gos->begin(); it != gos->end(); ++it)
    {
      GameObject* go = it->second;
      WWGameObject* w = dynamic_cast<WWGameObject*>(go);
      if (w)
      {
        w->RecalcAABB();
      }
    }

    TheLurker::Instance()->Update();
  }
}

void GSMainEdit::Draw()
{
  GSMain::Draw();

  if (m_isSelecting)
  {
    m_isSelecting = false;
    m_selectedObj = 0;

    GetGameSceneGraph()->GetCamera()->Draw();

    Vec3f mouseWorldNear;
    Vec3f mouseWorldFar;

    Unproject(Vec2f(m_mouseScreen.x, m_mouseScreen.y), 0, &mouseWorldNear);
    Unproject(Vec2f(m_mouseScreen.x, m_mouseScreen.y), 1, &mouseWorldFar);
    LineSeg lineSeg(mouseWorldNear, mouseWorldFar);

/*
    // Draw for debugging
    std::cout << "Selecting, mouse: x: " << m_mouseScreen.x << " y: " << m_mouseScreen.y << "\n";
    AmjuGL::PushAttrib(AmjuGL::AMJU_TEXTURE_2D);
    AmjuGL::Disable(AmjuGL::AMJU_TEXTURE_2D);
    AmjuGL::DrawLine(AmjuGL::Vec3(mouseWorldNear.x + 0.1f, mouseWorldNear.y + 0.1f, mouseWorldNear.z),
      AmjuGL::Vec3(mouseWorldFar.x, mouseWorldFar.y, mouseWorldFar.z));
    AmjuGL::PopAttrib();
*/

    GameObjects* objs = TheGame::Instance()->GetGameObjects();
    float bestDist = 999999.9f;
    for (GameObjects::iterator it = objs->begin(); it != objs->end(); ++it)
    {
      GameObject* pgo = it->second;
      Assert(pgo);
      const AABB& aabb = pgo->GetAABB();
      if (Clip(lineSeg, aabb, 0))
      {
        // Line seg intersects this box
        Assert(dynamic_cast<WWGameObject*>(pgo));
        // Choose object whose centre (position) is closest to line seg..?
        float dist = LineSeg(mouseWorldNear, mouseWorldFar).SqDist(pgo->GetPos());
        //float dist = (mouseWorldNear - pgo->GetPos()).SqLen(); // pick closest
        if (dist < bestDist)
        {
          bestDist = dist;
          m_selectedObj = (WWGameObject*)pgo;
        }
      }
    }

    if (m_selectedObj)
    {
      // Don't move camera
      GetCamera()->SetControllable(false);

      const std::string name = m_selectedObj->GetTypeName();
      std::string s = "Selected " + name  + " ID: " + ToString(m_selectedObj->GetId());
      m_infoText.SetText(s);

      // Set m_selNode to decorate node for the selected game object (assume all Game objects have a scene node)
      m_selNode->SetSelNode(m_selectedObj->GetSceneNode());

      // TODO
      m_contextMenu->Clear();
      //m_contextMenu->AddChild(new GuiMenuItem("Move " + name, Amju::OnMove));
      //m_contextMenu->AddChild(new GuiMenuItem("Rotate", OnRotate));
      m_contextMenu->AddChild(new GuiMenuItem("Duplicate", Amju::OnDuplicate));
      m_contextMenu->AddChild(new GuiMenuItem("Delete", Amju::OnDelete));
      m_contextMenu->AddChild(new GuiMenuItem("Properties...", OnProperties));
    }
    else
    {
      m_contextMenu->Clear();
      m_infoText.SetText("Nothing selected");
      GetCamera()->SetControllable(true);
    }
  }
}

void GSMainEdit::Draw2d()
{
//  GSMain::Draw2d();
  TheLurker::Instance()->Draw();

  m_topMenu->SetVisible(true); // always visible
  m_topMenu->Draw();
  m_contextMenu->Draw();
  m_infoText.Draw();
  TheCursorManager::Instance()->Draw();
}

static bool s_drag = false;

bool GSMainEdit::OnMouseButtonEvent(const MouseButtonEvent& mbe)
{
  switch (mbe.button)
  {
  case AMJU_BUTTON_MOUSE_LEFT:
    // Select an object. Convert cursor pos to world coords at front and back of frustum.
    // Find nearest object which intersects line seg.
    if (mbe.isDown)
    {
      s_drag = true;

      m_mouseScreen.x = mbe.x;
      m_mouseScreen.y = mbe.y;
      m_isSelecting = true;
    }
    else
    {
      s_drag = false;
    }

    break;

  case AMJU_BUTTON_MOUSE_RIGHT:
    if (mbe.isDown)
    {
      m_contextMenu->SetLocalPos(Vec2f(mbe.x, mbe.y));
      m_contextMenu->SetVisible(true);
    }
    else
    {
      // Hide menu
      m_contextMenu->SetVisible(false);
    }
    break;

  default:
    break;
  }

  return false;
}

class MoveCommand : public GuiCommand
{
public:
  MoveCommand(WWGameObject* obj, const Vec3f& move) : m_obj(obj), m_move(move)
  {
  }

  virtual bool Do() override
  {
    m_obj->Move(m_move);
    s_unsaved++;
    return true;
  }

  virtual void Undo() override
  {
    s_unsaved--;
    m_move = -m_move;
    Do();
    m_move = -m_move;
  }

private:
  RCPtr<WWGameObject> m_obj;
  Vec3f m_move;
};


bool GSMainEdit::OnCursorEvent(const CursorEvent& ce)
{
  static Vec2f oldPos(ce.x, ce.y);
  Vec2f pos(ce.x, ce.y);
  Vec2f diff = pos - oldPos;

  // TODO
  if (m_selectedObj && s_drag)
  {
//std::cout << "Moving object " << m_selectedObj->GetId() << "\n";
    // Decide which direction to move - i.e. is diff more closely aligned 
    //  with +x, -1, +y, -1, +z or -z 
    Vec3f dir(diff.x, diff.y, 0);
    dir.Normalise();

    // Get camera rotation matrix
    SceneNodeCamera* camera = GetGameSceneGraph()->GetCamera();
    Matrix mv = camera->GetMatrix();

    Vec3f axes[3] = 
    {
      Vec3f(mv[0], mv[4], mv[8]),
      Vec3f(mv[1], mv[5], mv[9]),
      Vec3f(mv[2], mv[6], mv[10])
    };
    float dots[3] =
    {
      DotProduct(dir, axes[0]),
      DotProduct(dir, axes[1]),
      DotProduct(dir, axes[2])
    };
    float fabs[3] = 
    {
      (float)::fabs(dots[0]), 
      (float)::fabs(dots[1]), 
      (float)::fabs(dots[2]) 
    };

//std::cout << "X dot: " << dots[0] << "\n";
//std::cout << "Y dot: " << dots[1] << "\n";
//std::cout << "Z dot: " << dots[2] << "\n";

    Vec3f move = dots[0] < 0 ? Vec3f(-1, 0, 0) : Vec3f(1, 0, 0);
    if (fabs[1] > fabs[0] && fabs[1] > fabs[2])
    {
      // Y axis
      move = dots[1] < 0 ? Vec3f(0, -1, 0) : Vec3f(0, 1, 0);
    }
    else if (fabs[2] > fabs[0] && fabs[2] > fabs[1])
    {
      // Z axis
      move = dots[2] < 0 ? Vec3f(0, 0, -1) : Vec3f(0, 0, 1);
    }

    move *= 50.0f;
    MoveCommand* mc = new MoveCommand(m_selectedObj, move);
    TheGuiCommandHandler::Instance()->DoNewCommand(mc);
  }

  oldPos = pos;
  return false;
}

bool GSMainEdit::OnKeyEvent(const KeyEvent& ke)
{
  if (ke.keyType == AMJU_KEY_CHAR && !ke.keyDown && ke.key == 'z')
  {
    OnUndo();
    return true;
  }

  return false;
}
}

