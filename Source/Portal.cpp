#include <Game.h>
#include <GameObjectFactory.h>
#include <File.h>
#include "Portal.h"
#include "Player.h"
#include "PropertyKeys.h"
#include "PropertiesDialog.h"

namespace Amju
{
const char* Portal::NAME = "portal";

GameObject* CreatePortal() { return new Portal; }
static bool reg = TheGameObjectFactory::Instance()->Add(Portal::NAME, &CreatePortal);

Portal::Portal()
{
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
  // TODO Special state?

  Assert(m_destId != -1);
  GameObject* obj = TheGame::Instance()->GetGameObject(m_destId);
  Vec3f pos = obj->GetPos();
  p->SetPos(pos);
  // Set the other object as collided with, so we don't keep travelling
  //  back and forth between 2 portals
  // TODO

  // Set the player forward dir to the heading of the portal
  //p->SetDir(GetDir());
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
