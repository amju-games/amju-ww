#include <EventPoller.h>
#include <Unproject.h>
#include <ClipLineSegBox.h>
#include <GuiMenu.h>
#include <GameObjectFactory.h>
#include <ConfigFile.h>
#include <Directory.h>
#include <GuiCommandHandler.h>
#include <Screen.h>
#include <DrawRect.h>
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
#include "Describe.h"
#include "SaveDir.h"
#include "Viewport.h"
#include "EditViewport.h"

namespace Amju
{
static FileDialog s_fileDialog; 

static MessageBox s_messageBox;

static const char* LAST_PATH = "last_path";

static std::string s_lastPath = TheGameConfigFile::Instance()->
  GetValue(LAST_PATH, GetSaveDir()); 

static int s_unsaved = 0; // number of commands away from save

static bool s_drag = false;


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

static EditModeCamera* GetCamera()
{
  SceneNodeCamera* c = GetGameSceneGraph()->GetCamera();
  return dynamic_cast<EditModeCamera*>(c);
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
  s_fileDialog.SetTitle("Save level");
  DoModalDialog(&s_fileDialog);
}

static void OnQuitSaveChanges(Dialog* dlg)
{
  int r = dlg->GetResult();
  if (r == AMJU_OK)
  {
    std::cout << "Quit->Save OK clicked.\n";
    OnSaveLevel();
  }
  else if (r == AMJU_NO)
  {
    std::cout << "Quit->Save NO clicked.\n";
    // Don't save
    TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());  
  }
  else if (r == AMJU_CANCEL)
  {
    std::cout << "Quit->Save CANCEL clicked.\n";
  }
}

static void OnQuitEditMode()
{
  // TODO prompt for save if any unsaved changes
  if (s_unsaved)
  {
    s_messageBox.SetFinishCallback(OnQuitSaveChanges);
    s_messageBox.SetMessage("Unsaved changes! Do you want to save?");
    s_messageBox.SetTitle("Quit edit mode");
    DoModalDialog(&s_messageBox); 
  }
  else 
  {
    TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());  
  }
}

static void OnNewSaveChanges(Dialog* dlg)
{
  int r = dlg->GetResult();
  if (r == AMJU_OK)
  {
    std::cout << "New->Save OK clicked.\n";
    OnSaveLevel();
  }
  else if (r == AMJU_NO)
  {
    std::cout << "New->Save NO clicked.\n";
    // Don't save - load boilerplate new level
    // TODO
  }
  else if (r == AMJU_CANCEL)
  {
    std::cout << "New->Save CANCEL clicked.\n";

  }
}

static void OnNewLevel()
{
  // If unsaved changes, go to save dialog
  if (s_unsaved)
  {
    s_messageBox.SetFinishCallback(OnNewSaveChanges);
    s_messageBox.SetMessage("Unsaved changes! Do you want to save?");
    s_messageBox.SetTitle("New level");
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
  s_fileDialog.SetTitle("Load level");
  DoModalDialog(&s_fileDialog);
}

static void OnLoadSaveChanges(Dialog* dlg)
{
  if (dlg->GetResult() == AMJU_OK)
  {
    std::cout << "Load->Save OK clicked.\n";
    // Yes/OK - save
    OnSaveLevel();
  }
  else if (dlg->GetResult() == AMJU_NO)
  {
    std::cout << "Load->Save NO clicked.\n";
    // Don't save, go to Load dialog
    DoLoadDialog();
  }
  else
  {
    std::cout << "Load->Save CANCEL clicked.\n";
    // Cancel: do nothing
  }
}

static void OnLoadLevel()
{
  // If unsaved changes, go to save dialog
  if (s_unsaved)
  {
    s_messageBox.SetFinishCallback(OnLoadSaveChanges);
    s_messageBox.SetMessage("Unsaved changes! Do you want to save?");
    s_messageBox.SetTitle("Load level");
    DoModalDialog(&s_messageBox); 
  }
  else
  {
    DoLoadDialog();
  }
}

static void OnUndo()
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

static void OnObjectRotateCW()
{
  TheGSMainEdit::Instance()->OnObjectRotate(90.0f);
}

static void OnObjectRotateCCW()
{
  TheGSMainEdit::Instance()->OnObjectRotate(-90.0f);
}

static void OnCamRotate()
{
  GetCamera()->SetMode(EditModeCamera::AMJU_ROTATE);
}

static void OnPan()
{
  GetCamera()->SetMode(EditModeCamera::AMJU_PAN);
}

static void OnZoom()
{
  GetCamera()->SetMode(EditModeCamera::AMJU_ZOOM);
}

static void OnDuplicate()
{
  // Clone currently selected object
  TheGSMainEdit::Instance()->OnDuplicate();
}

static void OnDelete()
{
  TheGSMainEdit::Instance()->OnDelete();
}

static void OnProperties()
{
}


GSMainEdit::GSMainEdit()
{
  m_playTestMode = false;
  m_gridSize = 50.0f;

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

  GuiMenu* objectSubmenu = new GuiMenu;
  objectSubmenu->AddChild(new GuiMenuItem("Delete", Amju::OnDelete));
  objectSubmenu->AddChild(new GuiMenuItem("Duplicate", Amju::OnDuplicate));
  objectSubmenu->AddChild(new GuiMenuItem("Rotate +90", Amju::OnObjectRotateCW));
  objectSubmenu->AddChild(new GuiMenuItem("Rotate -90", Amju::OnObjectRotateCCW));
  objectSubmenu->AddChild(new GuiNestMenuItem("New > ", newObjSubmenu));

  GuiMenu* runSubmenu = new GuiMenu;
  runSubmenu->AddChild(new GuiMenuItem("Start     ", OnStart));
  runSubmenu->AddChild(new GuiMenuItem("Stop    ", OnStop));

  GuiMenu* cameraSubmenu = new GuiMenu;
  cameraSubmenu->AddChild(new GuiMenuItem("Rotate     ", OnCamRotate));
  cameraSubmenu->AddChild(new GuiMenuItem("Pan     ", OnPan));
  cameraSubmenu->AddChild(new GuiMenuItem("Zoom     ", OnZoom));

  m_topMenu->AddChild(new GuiNestMenuItem("File    ", fileSubmenu));
  m_topMenu->AddChild(new GuiNestMenuItem("Edit    ", editSubmenu));
  m_topMenu->AddChild(new GuiNestMenuItem("Object    ", objectSubmenu));
  m_topMenu->AddChild(new GuiNestMenuItem("Run    ", runSubmenu));
  m_topMenu->AddChild(new GuiNestMenuItem("Camera    ", cameraSubmenu));

  m_infoText.SetLocalPos(Vec2f(-1, -0.9f));
  m_infoText.SetSize(Vec2f(2, 0.1f));
  m_infoText.SetBgCol(Colour(1, 1, 1, 1));
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

class AddNewCommand : public GuiCommand
{
public:
  AddNewCommand(WWGameObject* obj) : m_obj(obj)
  {
  }

  virtual bool Do() override
  {
    m_obj->AddToGame();

    // Move away from original object, so we can tell the objects apart
    // TODO Make move a ctor param
    //Vec3f move(10, 10, 10);
    //m_obj->Move(move);

    TheGSMainEdit::Instance()->SetSelectedObject(m_obj);

    s_unsaved++;
    return true; // undoable
  }

  virtual void Undo() override
  {
    m_obj->RemoveFromGame();
    s_unsaved--;
  }

private:
  RCPtr<WWGameObject> m_obj;
};


void GSMainEdit::OnDuplicate()
{
  if (m_selectedObj)
  {
std::cout << "Duplicating object: " << Describe(m_selectedObj) << "\n";

    RCPtr<WWGameObject> newObj = m_selectedObj->Clone();
    int id = TheLevelManager::Instance()->GetUniqueId();
std::cout << "New unique ID: " << id << "\n";
    newObj->SetId(id);

    // Need to call Load on the new object?? Easier than cloning all scene nodes?

    // Make the new object the selected obj ?
    m_selectedObj = newObj;

    AddNewCommand* c = new AddNewCommand(newObj);
    TheGuiCommandHandler::Instance()->DoNewCommand(c);
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

class RotateCommand : public GuiCommand
{
public:
  RotateCommand(WWGameObject* obj, float angleDegs) : m_obj(obj), m_yRot(angleDegs)
  {
  }

  virtual bool Do() override
  {
    m_obj->RotateY(m_yRot);
    s_unsaved++;
    return true;
  }

  virtual void Undo() override
  {
    m_obj->RotateY(-m_yRot);
    s_unsaved--;
  }

private:
  RCPtr<WWGameObject> m_obj;
  float m_yRot;
};

void GSMainEdit::OnObjectRotate(float degs)
{
  if (m_selectedObj)
  {
    RotateCommand* c = new RotateCommand(m_selectedObj, degs);
    TheGuiCommandHandler::Instance()->DoNewCommand(c);
  }
}

void GSMainEdit::OnDeactive()
{
  GSMain::OnDeactive();
  TheEventPoller::Instance()->RemoveListener(m_topMenu);
}

void GSMainEdit::OnActive()
{
  m_selectedObj = 0;
  m_isSelecting = false;

  GSMain::OnActive();
  // Show bounding boxes - TODO don't use this, draw object AABBs
  SceneNode::SetGlobalShowAABB(true);

  //GetGameSceneGraph()->SetCamera(new EditModeCamera);
  
  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  Assert(root);

  TheEventPoller::Instance()->AddListener(m_topMenu, -1); // hi pri

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
  //GSMain::Draw();
  int numVps = TheViewportManager::Instance()->GetNumViewports();
  for (int i = 0; i < numVps; i++)
  {
    Viewport* vp = TheViewportManager::Instance()->GetViewport(i);
    EditViewport* evp = dynamic_cast<EditViewport*>(vp);
    Assert(evp);
    evp->Draw();

    if (evp->IsActive() && m_isSelecting)
    {
      m_isSelecting = false;
      m_selectedObj = 0; // TODO multi select

      GetGameSceneGraph()->GetCamera()->Draw(); // ?

      Vec3f mouseWorldNear;
      Vec3f mouseWorldFar;

      Vec2f mouseScreen = evp->ConvertScreenCoord(m_mouseScreen);
      Assert(mouseScreen.x >= -1.0f);
      Assert(mouseScreen.x <=  1.0f);
      Assert(mouseScreen.y >= -1.0f);
      Assert(mouseScreen.y <=  1.0f);

      Unproject(Vec2f(mouseScreen.x, mouseScreen.y), 0, &mouseWorldNear);
      Unproject(Vec2f(mouseScreen.x, mouseScreen.y), 1, &mouseWorldFar);
      LineSeg lineSeg(mouseWorldNear, mouseWorldFar);


      // Draw for debugging
      std::cout << "Selecting, screen mouse: x: " << m_mouseScreen.x << " y: " << m_mouseScreen.y << "\n";
      std::cout << "  Viewport: x: " << mouseScreen.x << " y: " << mouseScreen.y << "\n";
      AmjuGL::PushAttrib(AmjuGL::AMJU_TEXTURE_2D);
      AmjuGL::Disable(AmjuGL::AMJU_TEXTURE_2D);
      AmjuGL::DrawLine(AmjuGL::Vec3(mouseWorldNear.x + 0.1f, mouseWorldNear.y + 0.1f, mouseWorldNear.z),
        AmjuGL::Vec3(mouseWorldFar.x, mouseWorldFar.y, mouseWorldFar.z));
      AmjuGL::PopAttrib();


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

      SetSelectedObject(m_selectedObj);
    }
  }

  AmjuGL::Viewport(0, 0, Screen::X(), Screen::Y());
}

void GSMainEdit::SetSelectedObject(GameObject* obj)
{
  m_accumulatedDragMove = Vec3f();
  if (obj)
  {
    m_selectedObj = dynamic_cast<WWGameObject*>(obj);

    // Don't move camera
    GetCamera()->SetControllable(false);

    const std::string name = m_selectedObj->GetTypeName();
    std::string s = "Selected " + name  + " ID: " + ToString(m_selectedObj->GetId());
    m_infoText.SetText(s);

    // Set m_selNode to decorate node for the selected game object (assume all Game objects have a scene node)
    m_selNode->SetSelNode(m_selectedObj->GetSceneNode());

/*
    // TODO
    m_contextMenu->Clear();
    //m_contextMenu->AddChild(new GuiMenuItem("Move " + name, Amju::OnMove));
    //m_contextMenu->AddChild(new GuiMenuItem("Rotate", OnObjectRotate));
    m_contextMenu->AddChild(new GuiMenuItem("Duplicate", Amju::OnDuplicate));
    m_contextMenu->AddChild(new GuiMenuItem("Delete", Amju::OnDelete));
    m_contextMenu->AddChild(new GuiMenuItem("Properties...", OnProperties));
*/
  }
  else
  {
    m_contextMenu->Clear();
    m_infoText.SetText("Nothing selected");
    //GetCamera()->SetControllable(true);
  }
}

void GSMainEdit::Draw2d()
{
// DOne in Game::Draw
//  AmjuGL::SetMatrixMode(AmjuGL::AMJU_PROJECTION_MATRIX);
//  AmjuGL::SetIdentity();
//  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
//  AmjuGL::SetIdentity();
 
  int numVps = TheViewportManager::Instance()->GetNumViewports();
  for (int i = 0; i < numVps; i++)
  {
    Viewport* vp = TheViewportManager::Instance()->GetViewport(i);
    EditViewport* evp = dynamic_cast<EditViewport*>(vp);
    Assert(evp);

    evp->Draw2d();

    if (s_drag && evp->IsActive())
    {
      Rect rect(evp->ConvertScreenCoord(m_mouseScreen), 
        evp->ConvertScreenCoord(m_mouseScreenAnchor));
      AmjuGL::Disable(AmjuGL::AMJU_TEXTURE_2D);
      DrawRect(rect);
    }
  }
  AmjuGL::Viewport(0, 0, Screen::X(), Screen::Y());

//  GSMain::Draw2d();
  // ?? Why in Edit mode??
  TheLurker::Instance()->Draw();

  m_topMenu->SetVisible(true); // always visible
  m_topMenu->Draw();
  m_contextMenu->Draw();
  m_infoText.Draw();

#if !defined(WIN32) && !defined(MACOSX)
  // Not needed for Windows or Mac - we have a mouse cursor already
  TheCursorManager::Instance()->Draw();
#endif
}

bool GSMainEdit::OnMouseButtonEvent(const MouseButtonEvent& mbe)
{
  if (mbe.isDown)
  {
    int active = -1;
    // Choose active viewport - this matches what's in StartGame.cpp:CreateEditViewports()
    if (mbe.x > 0)
    {
      // Right
      if (mbe.y > 0)
      {
        // Top
        active = AMJU_TOP_RIGHT; 
      }
      else
      {
        active = AMJU_BOTTOM_RIGHT;
      }
    }
    else
    {
      // Left
      if (mbe.y > 0)
      {
        // Top
        active = AMJU_TOP_LEFT;
      }
      else
      {
        active = AMJU_BOTTOM_LEFT;
      }
    }
    EditViewport::SetActiveId(active);
  }

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

      m_mouseScreenAnchor = m_mouseScreen;

      m_isSelecting = true;
    }
    else
    {
      s_drag = false;
    }

    break;

  case AMJU_BUTTON_MOUSE_RIGHT:
/*
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
*/
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
  m_mouseScreen = pos;

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

    EditModeCamera* cam = GetCamera();
    float zoomDist = sqrt((cam->GetEyePos() - cam->GetLookAtPos()).SqLen());

    m_accumulatedDragMove += move; 
    float limit = m_gridSize * 100.0f / zoomDist; 
    if (m_accumulatedDragMove.SqLen() > limit * limit)
    {
      m_accumulatedDragMove = Vec3f();
      move *= m_gridSize;
      MoveCommand* mc = new MoveCommand(m_selectedObj, move);
      TheGuiCommandHandler::Instance()->DoNewCommand(mc);
    }
  }

  oldPos = pos;
  return false;
}

bool GSMainEdit::OnKeyEvent(const KeyEvent& ke)
{
  // Keyboard shortcuts
  if (ke.keyType == AMJU_KEY_CHAR && !ke.keyDown && ke.key == 'z')
  {
    OnUndo();
    return true;
  }

  if (ke.keyType == AMJU_KEY_CHAR && !ke.keyDown && ke.key == 'g')
  {
    m_gridSize *= 2.0f;
    std::string s = "Grid size: " + ToString(m_gridSize, 2);
    m_infoText.SetText(s);
  }

  if (ke.keyType == AMJU_KEY_CHAR && !ke.keyDown && ke.key == 'h')
  {
    m_gridSize *= 0.5f;
    std::string s = "Grid size: " + ToString(m_gridSize, 2);
    m_infoText.SetText(s);
  }

  return false;
}
}

