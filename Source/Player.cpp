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
#include "GSLoadLevel.h"
#include "GameObjectFactory.h"
#include "Game.h"
#include "BlinkCharacter.h"
#include "MySceneGraph.h"
#include "PlayerInfo.h"
#include "PlayerInfoKey.h"
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
  m_playerId = 0;
}

const char* Player::GetTypeName() const
{
  return NAME;
}

void Player::SetPlayerId(int playerId)
{
  m_playerId = playerId;
}

int Player::GetPlayerId() const
{
  return m_playerId;
}

bool Player::Load(File* f)
{
  if (!OnFloorCharacter::Load(f))
  {
    return false;
  }
  m_startPos = m_pos;

  if (!f->GetInteger(&m_playerId))
  {
    f->ReportError("No player ID!?");
    return false;
  }

  m_pSceneNode = new BlinkCharacter;

  std::string meshName;
  if (!f->GetDataLine(&meshName))
  {
    f->ReportError("No mesh name for player");
    return false;
  }

  // Load mesh and textures from file
  if (!((BlinkCharacter*)m_pSceneNode)->LoadMd2(meshName))
  {
    return false;
  }

  std::string tex1Name, tex2Name;
  if (!f->GetDataLine(&tex1Name) || !f->GetDataLine(&tex2Name))
  {
    f->ReportError("Failed to get 2 textures for player");
    return false;
  }

  if (!((BlinkCharacter*)m_pSceneNode)->LoadTextures(tex1Name, tex2Name))
  {
    return false;
  }

  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(m_pSceneNode);

  // Create Shadow Scene Node
  if (!LoadShadow(f))
  {
    return false;
  }

  return true;

  /*
    TODO Maybe use this one: "C:/JAY/BANANA/AMJU-EXTRA/AMJU-guitar2.MD2"
    C:/JAY/BANANA/AMJU-EXTRA/AMJU2-GUITAR.BMP"
  */
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
  if (be.controller != m_playerId)
  {
    return;
  }

  if (!m_floor)
  {
    return;
  }

  if (IsFalling())
  {
    return;
  }

  if (be.button == AMJU_BUTTON_A)
  {
    Jump();
  }

  // TODO Home > Pause
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

  if (m_playerId == 0)
  {
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
    case AMJU_KEY_SPACE:
      Jump();
      break;
    default:
      break;
    }
  }
}

void Player::OnBalanceBoardEvent(const BalanceBoardEvent& bbe)
{
  // Only player 0 can use BB
  if (0 != GetPlayerId()) 
  {
    return;
  }

  if (!m_floor)
  {
    return;
  }

  if (IsFalling())
  {
    return;
  }

  float x = bbe.x;
  float y = bbe.y;
  
#ifdef IPHONE

  // TODO Set OFFSET when in non-game mode
  const float OFFSET = 0.5f;
  const float DEAD_ZONE = 0.1f;
  // TODO Make these 'sensitivity' settings
  const float X_MULT = 4.0f;
  const float Y_MULT = 3.0f;
  
  if (x > -DEAD_ZONE && x < DEAD_ZONE)
  {
    x = 0;
  }
  else 
  {
    x *= X_MULT;
  }
  
  // y=0 when iphone is horizontal, so compensate for angle at which player is holding iphone
  y -= OFFSET;
  if (y > -DEAD_ZONE && y < DEAD_ZONE)
  {
    y = 0;
  }
  else 
  {
    y *= Y_MULT;
  }
#endif

  m_vel.x = x * 100.0f; 
  m_vel.z = y * 100.0f; 

  // Work out direction to face
  SetDir(RadToDeg(atan2((double)bbe.x, (double)bbe.y)));

  SetIsControlled(true); 
}

void Player::OnRotationEvent(const RotationEvent& re)
{
  if (re.controller != GetPlayerId()) 
  {
    return;
  }

  if (!m_floor)
  {
    return;
  }

  if (IsFalling())
  {
    return;
  }

  float degs = re.degs;
  // Dead zone
  if (fabs(degs) < 5.0f) // TODO CONFIG
  {
    degs = 0;
  }

  static const float MULT = 1.0f;
  // hold controller with + on left, like SNES..?
  // TODO Make this configurable
  if (re.axis == AMJU_AXIS_X)
  {
    m_vel.x = MULT * -degs; // or put the -ve in EventsWii ??
  }
  else if (re.axis == AMJU_AXIS_Z)
  {
    m_vel.z = MULT * degs; 
  }

  // Work out direction to face
  SetDir(RadToDeg(atan2((double)m_vel.x, (double)m_vel.z)));

  SetIsControlled(true); 
}

void Player::OnJoyAxisEvent(const JoyAxisEvent& je)
{
  if (je.controller != GetPlayerId()) 
  {
    return;
  }

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
  OnFloorCharacter::Update();

  // Set AABB 
  static const float XSIZE = 15.0f;
  static const float YSIZE = 60.0f;
  GetAABB()->Set(
    m_pos.x - XSIZE, m_pos.x + XSIZE, 
    m_pos.y, m_pos.y + YSIZE, 
    m_pos.z - XSIZE, m_pos.z + XSIZE);

  // If we have fallen, go to life lost state
  if (IsDead())
  {
    // Reduce number of lives
    PlayerInfo* pInfo = ThePlayerInfoManager::Instance()->GetPlayerInfo(GetPlayerId());
    int lives = pInfo->GetInt(PlayerInfoKey::LIVES);
    lives--;
    pInfo->Set(PlayerInfoKey::LIVES, lives);

    if (lives == 0)
    {
      TheGame::Instance()->SetCurrentState(GSGameOver::NAME);
    }
    else
    {
      TheGame::Instance()->SetCurrentState(GSLoadLevel::NAME);
    }
  }
}
}
