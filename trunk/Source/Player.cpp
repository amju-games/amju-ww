#include "AmjuFirst.h"
#include "Player.h"
#ifdef WIN32
#define _USE_MATH_DEFINES // ffs
#endif // WIN32
#include <math.h>
#include "File.h"
#include "ReportError.h"
#include "ResourceManager.h"
#include "Timer.h"
#include "DegRad.h"
#include "EventPoller.h"
#include "Floor.h"
#include "GSGameOver.h"
#include "GameObjectFactory.h"
#include "Game.h"
#include "AmjuFinal.h"

namespace Amju
{
static const float MAX_SPEED = 100.0f; // TODO CONFIG

GameObject* CreatePlayer() { return new Player; }
static bool reg = TheGameObjectFactory::Instance()->Add(Player::NAME, &CreatePlayer);

const char* Player::NAME = "player";

Player::Player()
{
  TheEventPoller::Instance()->AddListener(this);

  // Set AABB size
  static const float XSIZE = 15.0f;
  static const float YSIZE = 60.0f;
  m_aabb.Set(
    -XSIZE, XSIZE, 
    0, YSIZE, 
    -XSIZE, XSIZE);
}

const char* Player::GetTypeName() const
{
  return NAME;
}

bool Player::Load(File* f)
{
  if (!OnFloor::Load(f))
  {
    return false;
  }

// TODO Maybe use this one: "C:/JAY/BANANA/AMJU-EXTRA/AMJU-guitar2.MD2"
//  + "C:/JAY/BANANA/AMJU-EXTRA/AMJU2-GUITAR.BMP"

  m_pModel = (Md2Model*)TheResourceManager::Instance()->GetRes("amju.md2");
  if (!m_pModel)
  {
    ReportError("Failed to load amju MD2");
    return false;
  }

  m_pTex[0] = (Texture*)TheResourceManager::Instance()->GetRes("amju2.bmp");
  Assert(m_pTex[0]);

  m_pTex[1] = (Texture*)TheResourceManager::Instance()->GetRes("amju2a.bmp");
  Assert(m_pTex[1]);

  m_shadow.Load();

  return true;
}

void Player::Jump()
{
  // Jump if we are on ground
  if (!IsFalling())
  {
    m_vel.y = 100.0f; // TODO CONFIG -- power up ?
    SetIsFalling(true);
  }
}

void Player::OnButtonEvent(const ButtonEvent& be)
{
  if (be.button == AMJU_BUTTON_A)
  {
    Jump();
  }
}

void Player::OnKeyEvent(const KeyEvent& ke)
{
  if (!m_floor)
  {
    return;
  }

  if (IsFalling())
  {
    return;
  }

  switch (ke.keyType)
  {
  case AMJU_KEY_UP:
    m_vel.z = ke.keyDown ? -MAX_SPEED : 0;
    SetDir(180.0f);
    SetIsControlled(true); 
    break;
  case AMJU_KEY_DOWN:
    m_vel.z = ke.keyDown ? MAX_SPEED : 0;
    SetDir(0.0f);
    SetIsControlled(true); 
    break;
  case AMJU_KEY_LEFT:
    m_vel.x = ke.keyDown ? -MAX_SPEED : 0;
    SetDir(-90.0f);
    SetIsControlled(true); 
    break;
  case AMJU_KEY_RIGHT:
    m_vel.x = ke.keyDown ? MAX_SPEED : 0;
    SetDir(90.0f);
    SetIsControlled(true); 
    break;
  case AMJU_KEY_CHAR:
    if (ke.key == ' ')
    {
      Jump();
    }
    break;
  default:
    break;
  }
}

void Player::OnBalanceBoardEvent(const BalanceBoardEvent& bbe)
{
  if (!m_floor)
  {
    return;
  }

  if (IsFalling())
  {
    return;
  }

  float xdiff = bbe.x - 320.0f;
  float ydiff = bbe.y - 240.0f;

  m_vel.x = xdiff * 0.1f;
  m_vel.z = ydiff * 0.1f;

  // Work out direction to face
  xdiff *= (float)(1.0 / 320.0); 
  ydiff *= (float)(1.0 / 240.0);
  SetDir(RadToDeg(atan2((double)xdiff, (double)ydiff)));

  SetIsControlled(true); 
}

void Player::OnJoyAxisEvent(const JoyAxisEvent& je)
{
  if (!m_floor)
  {
    return;
  }

  if (IsFalling())
  {
    return;
  }

  float stickX = je.x;
	float stickY = je.y;

  static const float DEADZONE = 0.1f; // TODO CONFIG
  float speed = 0;
	// Work out dir
	if (fabs(stickX) > DEADZONE || fabs(stickY) > DEADZONE)
	{
    // Player faces direction we are trying to move, not direction we may
    //  be sliding in ..?
		SetDir(RadToDeg(atan2((double)stickX, (double)stickY)));

  	// Work out speed ???
	  speed = sqrt(stickX * stickX + stickY * stickY) * MAX_SPEED;
	}

	// Set object vel 
  m_vel.x = (float) stickX * speed;
  m_vel.z = (float) stickY * speed;  

  SetIsControlled(true); 
}

void Player::Update()
{
  OnFloor::Update();

  // If we have fallen, go to life lost state
  if (IsDead())
  {
    TheGame::Instance()->SetCurrentState(GSGameOver::NAME);
  }
}

void Player::Draw()
{
  OnFloor::Draw();
  DrawShadow(); // TODO temp hack
}  
}
