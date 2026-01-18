#include <EventPoller.h>
#include <Unproject.h>
#include <ClipLineSegBox.h>
#include <GuiMenu.h>
#include <GameObjectFactory.h>
#include "GSMainEdit.h"
#include "GSTitle.h"
#include "Game.h"
#include "CursorManager.h"
#include "MySceneGraph.h"
#include "EditModeCamera.h"
#include "ModalDialog.h"

namespace Amju
{
static FileDialog fileDialog; // ?

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

// Menu item handlers
static void OnMove()
{
  TheGSMainEdit::Instance()->OnMove();
}

static void OnQuitEditMode()
{
  // TODO prompt for save
  TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());  
}

static void OnNewLevel()
{
}

static void OnLoadLevel()
{
std::cout << "Starting file modal dialog...\n";

  DoModalDialog(&fileDialog);
}

static void OnSaveLevel()
{
}

void OnRotate()
{
}

void OnDuplicate()
{
}

void OnDelete()
{
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

  GuiMenu* newObjSubmenu = new GuiMenu;
  // Get types from Game Obj factory
  std::vector<std::string> names = TheGameObjectFactory::Instance()->GetTypeNames();
  for (unsigned int i = 0; i < names.size(); i++)
  {
    newObjSubmenu->AddChild(new GuiMenuItem(names[i]));
  }

  m_topMenu->AddChild(new GuiNestMenuItem("File    ", fileSubmenu));
  m_topMenu->AddChild(new GuiNestMenuItem("New Object", newObjSubmenu));

  m_infoText.SetLocalPos(Vec2f(-1, -0.9f));
  m_infoText.SetSize(Vec2f(2, 0.1f));
}

void GSMainEdit::OnMove()
{
  // Change mode so arrow keys move currently selected object
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
  GSMain::OnActive();
  // Show bounding boxes
  SceneNode::SetGlobalShowAABB(true);

  GetGameSceneGraph()->SetCamera(new EditModeCamera);
  
  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  Assert(root);
//  root->AddChild(m_selNode.GetPtr()); // TODO how to ensure we only add it once ?

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
      m_contextMenu->AddChild(new GuiMenuItem("Move " + name, Amju::OnMove));
      m_contextMenu->AddChild(new GuiMenuItem("Rotate", OnRotate));
      m_contextMenu->AddChild(new GuiMenuItem("Duplicate", OnDuplicate));
      m_contextMenu->AddChild(new GuiMenuItem("Delete", OnDelete));
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

    Vec3f p = m_selectedObj->GetPos();
    move *= 10.0f;
    p += move;
    m_selectedObj->SetPos(p);
    m_selectedObj->RecalcAABB();

    SceneNode* sn = m_selectedObj->GetSceneNode();
    Assert(sn);
    Matrix mat;
    mat.Translate(move);
    sn->MultLocalTransform(mat);
  }

  oldPos = pos;
  return false;
}

}

