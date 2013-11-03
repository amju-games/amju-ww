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
#include "ParticleEffect2d.h"
#include "Pet.h"
#include <AmjuFinal.h>

namespace Amju
{
static const float MAX_SPEED = 100.0f; // TODO CONFIG
static const float RUN_SPEED = MAX_SPEED * 0.5f;
static const float WALK_SPEED = RUN_SPEED * 0.5f; 
static const float XSIZE = 15.0f; // AABB size
static const float YSIZE = 30.0f;

GameObject* CreatePlayer() { return new Player; }
static bool reg = TheGameObjectFactory::Instance()->Add(Player::NAME, &CreatePlayer);

const char* Player::NAME = "player";

class PlayerTrail : public ParticleEffect2d
{
public:
  PlayerTrail(Player* player) : m_player(player)
  {
  }

  virtual float NewTime() const
  {
    return 0;
  }

  virtual Vec3f NewPos() const
  {
    return m_player->GetPos() + Vec3f(0, 20.0f, 0); // TODO CONFIG
  }

  virtual void HandleDeadParticle(Particle2d* p)
  {
    Recycle(p);
  }

private:
  Player* m_player;
};

Player::Player()
{
  m_aabbExtents = Vec3f(XSIZE, YSIZE, XSIZE);
  m_controller = new PlayerController(this);
  TheEventPoller::Instance()->AddListener(m_controller);

  m_playerId = 0;
}

Player::~Player()
{
  TheEventPoller::Instance()->RemoveListener(m_controller);
}

const char* Player::GetTypeName() const
{
  return NAME;
}

const float BOTTOM_PET_Y = 60.0f;
const float PET_HEIGHT = 30.0f;
const float DETACH_RADIUS = 25.0f;

void Player::PickUpPet(Pet* pet)
{
  if (pet->GetCarryingPlayer())
  {
    return;
  }

std::cout << "Pick up pet! " << pet->GetId() << "\n";

  // Existing pets jump up to make room for new pet
  pet->SetCarryingPlayer(this);
  for (Pets::iterator it = m_pets.begin(); it != m_pets.end(); ++it)
  {
    Pet* p = *it;
    // Jump up
    p->SetVel(Vec3f(0, 50.0f, 0)); // TEST
  }
  // Set vel - above player
  pet->SetVel(Vec3f(0, 0, 0));
  pet->SetPos(m_pos + Vec3f(0, BOTTOM_PET_Y, 0));
  pet->RecalcAABB();

  m_pets.push_front(pet);
}

void Player::UpdatePets()
{
  float y = m_pos.y + BOTTOM_PET_Y;
  Vec3f posUnder = m_pos;
  for (Pets::iterator it = m_pets.begin(); it != m_pets.end(); /* inc in loop body */)
  {
    Pet* pet = *it;
    Vec3f pos = pet->GetPos();
    Vec3f vel = pet->GetVel();
    if (pos.y < y)
    {
      pos.y = y;
      // reverse y vel
//      if (vel.y < 0)
//      {
//        vel.y = -vel.y * 0.5f; // damping
//      }

      vel.y = 10.0f; // TEST

      // Move in dir of player (x, z)
      Vec3f v = (posUnder - pos) * 10.0f;
      vel.x = v.x;
      vel.z = v.z; 
    }   
    pet->SetVel(vel);
    Vec3f acc = pet->GetAcc();
    acc.x = -vel.x;
    acc.z = -vel.z;
    pet->SetAcc(acc);

//    pos.x = m_pos.x;
//    pos.z = m_pos.z;

    posUnder = pos;
    pet->SetPos(pos); 

    pet->RecalcAABB();

    y += PET_HEIGHT;

    // Check if pet has fallen off stack
    Vec3f xz = (pos - m_pos);
    xz.y = 0;
    float sqRad = xz.SqLen();
    if (sqRad > DETACH_RADIUS * DETACH_RADIUS)
    {
std::cout << "Dropping pet " << pet->GetId() << "\n";
      // Remove from stack
      pet->SetCarryingPlayer(0); 
      it = m_pets.erase(it);
    }
    else
    {
      ++it;
    }
  }
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

  BlinkCharacter* bc = new BlinkCharacter;
  m_pSceneNode = bc;

  std::string meshName;
  if (!f->GetDataLine(&meshName))
  {
    f->ReportError("No mesh name for player");
    return false;
  }

  // Load mesh and textures from file
  if (!bc->LoadMd2(meshName))
  {
    return false;
  }

  std::string tex1Name, tex2Name;
  if (!f->GetDataLine(&tex1Name) || !f->GetDataLine(&tex2Name))
  {
    f->ReportError("Failed to get 2 textures for player");
    return false;
  }

  if (!bc->LoadTextures(tex1Name, tex2Name))
  {
    return false;
  }

  bc->SetGameObj(this);
  // Add to scene graph later if we actually want this player in the level

  // Create Shadow Scene Node
  if (!LoadShadow(f))
  {
    return false;
  }

  // TODO
/*
  PlayerTrail* trail = new PlayerTrail(this);
  if (!trail->Load(f))
  {
    f->ReportError("Failed to load player trail");
    return false;
  }

  trail->Start();
  root->AddChild(trail);
*/

  return true;

  /*
    TODO Maybe use this one: "C:/JAY/BANANA/AMJU-EXTRA/AMJU-guitar2.MD2"
    C:/JAY/BANANA/AMJU-EXTRA/AMJU2-GUITAR.BMP"
  */
}

void Player::AddSceneNode()
{
  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  root->AddChild(m_pSceneNode);
}

void Player::Jump()
{
  // Jump if we are on ground
  if (!IsFalling())
  {
    m_vel.y = 100.0f; // TODO CONFIG -- power up ?
    SetIsFalling(true);
    SetAnim("jump");
  }
}

bool Player::OnButtonEvent(const ButtonEvent& be)
{
  if (be.controller != m_playerId)
  {
    return false;
  }

  if (!m_floor)
  {
    return false;
  }

  if (IsFalling())
  {
    return false;;
  }

  if (be.button == AMJU_BUTTON_A)
  {
    Jump();
    return true;
  }

  // TODO Home > Pause

  return false;
}

bool Player::OnKeyEvent(const KeyEvent& ke)
{
  if (!m_floor)
  {
    return false;
  }

  if (IsFalling())
  {
    return false;
  }

  if (m_playerId == 0)
  {
    switch (ke.keyType)
    {
    case AMJU_KEY_UP:
      m_vel.z = ke.keyDown ? -MAX_SPEED : 0;
      SetDir(180.0f);
      SetIsControlled(true); 
      return true;

    case AMJU_KEY_DOWN:
      m_vel.z = ke.keyDown ? MAX_SPEED : 0;
      SetDir(0.0f);
      SetIsControlled(true); 
      return true;

    case AMJU_KEY_LEFT:
      m_vel.x = ke.keyDown ? -MAX_SPEED : 0;
      SetDir(-90.0f);
      SetIsControlled(true); 
      return true;

    case AMJU_KEY_RIGHT:
      m_vel.x = ke.keyDown ? MAX_SPEED : 0;
      SetDir(90.0f);
      SetIsControlled(true); 
      return true;

    case AMJU_KEY_SPACE:
      Jump();
      return true;

    default:
      break;
    }
  }
  return false;
}

bool Player::OnBalanceBoardEvent(const BalanceBoardEvent& bbe)
{
  // Only player 0 can use BB
  if (0 != GetPlayerId()) 
  {
    return false;
  }

  if (!m_floor)
  {
    return false;
  }

  if (IsFalling())
  {
    return false;
  }

  Vec2f cp = bbe.GetCalibratedCoord();
  float x = cp.x;
  float y = cp.y;
  
#ifdef IPHONE

  // TODO Set OFFSET when in non-game mode
//  const float OFFSET = 0.5f;
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
//  y -= OFFSET;
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
  SetDir(RadToDeg(atan2((double)cp.x, (double)cp.y)));

  SetIsControlled(true); 
 
  return true;
}

bool Player::OnRotationEvent(const RotationEvent& re)
{
#ifdef GEKKO
  return false; // use nunchuck
#endif

  if (re.controller != GetPlayerId()) 
  {
    return false;
  }

  if (!m_floor)
  {
    return false;
  }

  if (IsFalling())
  {
    return false;
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
  return true;
}

bool Player::OnJoyAxisEvent(const JoyAxisEvent& je)
{
  if (je.controller != GetPlayerId()) 
  {
    return false;
  }

  if (!m_floor)
  {
    return false;
  }

  if (IsFalling())
  {
    return false;
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
  return true;
}

void Player::Update()
{
  OnFloorCharacter::Update();

  float speed = m_vel.SqLen();
  if (IsFalling())
  {
    // TODO fall/jump should be different
    SetAnim("jump");
  }
  else if (speed > RUN_SPEED)
  {
    SetAnim("run");
  }
  else if (speed > WALK_SPEED)
  {
    SetAnim("walk");
  }
  else
  {
    SetAnim("stand");
  }

  // Set AABB 
  RecalcAABB();

  UpdatePets();
   
  // If we have fallen, go to life lost state
  if (IsDead())
  {
    // Reduce number of lives
    PlayerInfo* pInfo = ThePlayerInfoManager::Instance()->GetPlayerInfo(GetPlayerId());
    int lives = pInfo->GetInt(PlayerInfoKey::LIVES);
    lives--;
    pInfo->Set(PlayerInfoKey::LIVES, lives);

std::cout << "Player is dead! Lives left: " << lives << "\n";

    if (lives == 0)
    {
      TheGame::Instance()->SetCurrentState(TheGSGameOver::Instance());
std::cout << "Game over.\n";
    }
    else
    {
      TheGame::Instance()->SetCurrentState(TheGSLoadLevel::Instance());
std::cout << "Loading level...\n";
    }
  }
}
}
