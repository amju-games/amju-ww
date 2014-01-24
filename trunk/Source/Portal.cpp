#include <Game.h>
#include <GameObjectFactory.h>
#include <File.h>
#include "Portal.h"
#include "Player.h"
#include "PropertyKeys.h"
#include "PropertiesDialog.h"
#include "GSSpiral.h"
#include "GSMain.h"
#include "PlayWav.h"

namespace Amju
{
const char* Portal::NAME = "portal";

GameObject* CreatePortal() { return new Portal; }
static bool reg = TheGameObjectFactory::Instance()->Add(Portal::NAME, &CreatePortal);

// Default portal size
static const float SIZE = 25.0f;

Portal::Portal()
{
  m_aabb.Set(-SIZE, SIZE, -SIZE, SIZE, -SIZE, SIZE);

  m_destId = -1;
}

WWGameObject* Portal::Clone() 
{
  return new Portal(*this);
}

const char* Portal::GetTypeName() const
{
  return NAME;
}

bool Portal::Load(File* f)
{
  if (!Trigger::Load(f))
  {
    return false;
  }
  if (!f->GetInteger(&m_destId))
  {
    f->ReportError("Expected portal dest ID");
    return false;
  }
  return true;
}

bool Portal::Save(File* f)
{
  if (!Trigger::Save(f))
  {
    return false;
  }
  f->WriteComment("// Dest ID");
  f->WriteInteger(m_destId);
  return true;
}

void Portal::OnPlayerCollision(Player* p)
{
  if (m_collidingPlayers.count(p) > 0)
  {
    return;
  }

  Assert(m_destId != -1);
  GameObject* obj = TheGame::Instance()->GetGameObject(m_destId);
  Assert(obj);
  Portal* otherPortal = dynamic_cast<Portal*>(obj);
  if (otherPortal)
  {
    // Set the other object as collided with, so we don't keep travelling
    //  back and forth between 2 portals
    otherPortal->m_collidingPlayers.insert(p);
  }

  // Can't take pets through portal, so using it has a cost
  p->DropPets();

  Vec3f pos = obj->GetPos();
  p->SetPos(pos);

  // Set the player forward dir to the heading of the portal
  //p->SetDir(GetDir());

  // Special state, with spiral for a split second
  static GSSpiral* sp = TheGSSpiral::Instance();
  sp->SetPrevState(TheGSMain::Instance());
  TheGame::Instance()->SetCurrentState(sp);

  PlayWav("laser_x");
}

void Portal::Update()
{
  Trigger::Update();

  // Check for players no longer intersecting
  // NB erasing elements while iterating over container
  for (auto it = m_collidingPlayers.begin(); it != m_collidingPlayers.end();    )
  {
    Player* p = *it;
    if (p->GetAABB().Intersects(GetAABB()))
    {
      ++it;
    }
    else
    {
      // No intersection - remove this player
#ifdef WIN32
      it = m_collidingPlayers.erase(it);
#else
      m_collidingPlayers.erase(it);
      ++it;
#endif
    }
  }
}

void Portal::AddPropertiesGui(PropertiesDialog* dlg)
{
  dlg->AddItem(new PropertiesDialog::IntItem("Dest ID", m_destId, PROP_DEST_ID));
}

PropertyValue Portal::GetProp(PropertyKey key)
{
  switch (key)
  {
  case PROP_DEST_ID:
    return m_destId;
  }
  return Trigger::GetProp(key);
}

void Portal::SetProp(PropertyKey key, PropertyValue value)
{
  Trigger::SetProp(key, value);
  switch (key)
  {
  case PROP_DEST_ID:
    m_destId = value.GetInt();
  }
}

}
