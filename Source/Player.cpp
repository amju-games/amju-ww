#include "AmjuFirst.h"
#include "Player.h"
#ifdef WIN32
#define _USE_MATH_DEFINES // ffs
#endif // WIN32
#include <math.h>
#include <AmjuRand.h>
#include <ROConfig.h>
#include <Game.h>
#include <File.h>
#include <ResourceManager.h>
#include <Timer.h>
#include <DegRad.h>
#include <EventPoller.h>
#include <ConfigFile.h>
#include "PowerUp.h"
#include "Floor.h"
#include "GSGameOver.h"
#include "GSLoadLevel.h"
#include "GameObjectFactory.h"
#include "BlinkCharacter.h"
#include "MySceneGraph.h"
#include "ParticleEffect2d.h"
#include "Pet.h"
#include "Score.h"
#include "PlayWav.h"
#include "Describe.h"
#include "GameMode.h"
#include "ShadowManager.h"
#include "Describe.h"
#include "LurkMsg.h"
#include "Hud.h"
#include "Exit.h"
#include "PropertiesDialog.h"
#include "PropertyKeys.h"
#include "Depth.h"
#include "Camera.h"
#include "GameConsts.h"
#include <AmjuFinal.h>

namespace Amju
{
static const float MAX_SPEED = 100.0f; // TODO CONFIG
static const float RUN_SPEED = MAX_SPEED * 0.5f;
static const float WALK_SPEED = RUN_SPEED * 0.5f; 
static const float XSIZE = 15.0f; // AABB size
static const float YSIZE = 20.0f;
static const float YOFFSET = 5.0f;

GameObject* CreatePlayer() { return new Player; }

#ifdef GLOBAL_INIT
static bool reg = TheGameObjectFactory::Instance()->Add(Player::NAME, &CreatePlayer);
#endif

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
  m_extentsYOffset = YSIZE + YOFFSET;
  m_extentsSet = true;
  m_playerId = 0;
  m_reachedExit = false;
  m_jumpCount = 0;
  m_petScoreTimer = 0;

  Reset();
}

Player::~Player()
{
  KillController();
}

void Player::OnHitFloor()
{
  // TODO Player-floor only
  // TEST
  // TODO 'ow!' wavs
  Amju::PlayWav("bouncefloor"); //hammer_anvil3"); // NB No file ext
  WWCamera* cam = GetActiveCamera();
  Assert(cam);
  cam->SetEarthquake(1.0f); // TODO CONFIG

  // Check the height we fell from 
  static const float MAX_DROP = ROConfig()->GetFloat("max-drop");
  Assert(MAX_DROP > 0);
  float df = CalcDropFallen();
#ifdef PLAYER_DEBUG
std::cout << Describe(this) << " hit floor, drop=" << df << "\n";
#endif
  if (df > MAX_DROP)
  {
#ifdef PLAYER_DEBUG
std::cout << Describe(this) << " dead, hit floor but max drop reached, drop=" << df << "\n";
#endif
    StartBeingDead(); // max drop reached, hit floor
  }
}

void Player::StartBeingDead() 
{
  // Stop scrolling - set speed to zero?????
  if (IsFalling())
  {
    return;
  }

  if (m_deathTimer == 0)
  {
    Amju::PlayWav("gasp");
    // Go to zoom camera
    KillController();
  }
  OnFloorCharacter::StartBeingDead();
}

void Player::StartBeingEaten(OnFloorCharacter* eater) 
{
  // Stop scrolling - set speed to zero?????

  // TODO being eaten sound??
//   Amju::PlayWav("gasp");
  // Go to zoom camera
  KillController();
  OnFloorCharacter::StartBeingEaten(eater);
}

void Player::AddPropertiesGui(PropertiesDialog* dlg)
{
  OnFloorCharacter::AddPropertiesGui(dlg);

  // TODO IntItem
  dlg->AddItem(new PropertiesDialog::IntItem("Player ID", m_playerId, PROP_PLAYER_ID));
}

PropertyValue Player::GetProp(PropertyKey key)
{
  return OnFloorCharacter::GetProp(key);
}

void Player::SetProp(PropertyKey key, PropertyValue value)
{
  OnFloorCharacter::SetProp(key, value);
}

void Player::CreateController()
{
  // TODO depends on whether local or remote
  m_controller = new PlayerController(this);
#ifdef GEKKO
  int PRIORITY = -99;
#else
  int PRIORITY = 99;
#endif
  TheEventPoller::Instance()->AddListener(m_controller, PRIORITY); 
}

void Player::KillController()
{
  static EventPoller* ep = TheEventPoller::Instance();
  if (m_controller && ep->HasListener(m_controller))
  {
    ep->RemoveListener(m_controller);
  }
  m_controller = 0;
}

WWGameObject* Player::Clone()
{
  return new Player(*this);
}

const char* Player::GetTypeName() const
{
  return NAME;
}

void Player::ReachedExit(Exit* exit)
{
  m_reachedExit = true;
  m_exitPos = exit->GetPos();

  SetIsTeleporting(true);

  KillController();

  ShadowManager* shm = TheShadowManager::Instance();
  shm->RemoveCaster(this);
  GetSceneNode()->SetVisible(false);
  for (PetList::iterator it = m_pets.begin(); it != m_pets.end(); ++it)
  {
    Pet* p = *it;
    p->GetSceneNode()->SetVisible(false);
    p->SetIsTeleporting(true);
    shm->RemoveCaster(p);
  }
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

#ifdef PLAYER_DEBUG
std::cout << "Pick up pet! " << pet->GetId() << "\n";
#endif

  // Existing pets jump up to make room for new pet
  pet->SetCarryingPlayer(this);
  Vec3f pos = GetPos();
  pet->SetPos(pos);
  m_pets.push_front(pet);

  // Get points
  Amju::PlayWav("cashreg"); // TODO temp - better sound required

  static const int PICK_UP_MULTIPLIER = ROConfig()->GetInt("pick-up-multiplier");
  int bonus = PICK_UP_MULTIPLIER * m_pets.size();
  TheScores::Instance()->AddToScore(static_cast<PlayerNum>(GetPlayerId()), bonus);

/*
  for (Pets::iterator it = m_pets.begin(); it != m_pets.end(); ++it)
  {
    Pet* p = *it;
    // Jump up
    p->SetVel(Vec3f(0, 100.0f, 0)); // TEST
  }
  // Set vel - above player
  pet->SetVel(Vec3f(0, 0, 0));
  pet->SetPos(m_pos + Vec3f(0, BOTTOM_PET_Y, 0));
  pet->RecalcAABB();
*/
}
  
void Player::Reset() 
{
  OnFloorCharacter::Reset();
  DropPets();
  static const float JUMP_VEL_INITIAL = ROConfig()->GetFloat("jump-vel-initial");
  m_jumpVel = JUMP_VEL_INITIAL;
  m_maxJumpCount = 1; // initially you can jump once
  m_isInvincible = false;
  m_velMult = 1;

  static const float DEFAULT_X_SENSITIVITY = ROConfig()->GetFloat("default-x-sensitivity");
  static const float DEFAULT_Y_SENSITIVITY = ROConfig()->GetFloat("default-y-sensitivity");

  m_xSensitivity = DEFAULT_X_SENSITIVITY;
  m_ySensitivity = DEFAULT_Y_SENSITIVITY;

  GameConfigFile* gcf = TheGameConfigFile::Instance();
  if (gcf->Exists(X_SENSITIVITY_KEY))
  {
    m_xSensitivity = gcf->GetFloat(X_SENSITIVITY_KEY);
  }
  
  if (gcf->Exists(Y_SENSITIVITY_KEY))
  {
    m_xSensitivity = gcf->GetFloat(Y_SENSITIVITY_KEY);
  }
}

void Player::DropPets()
{
  if (m_reachedExit)
  {
#ifdef PLAYER_DEBUG
    std::cout << "Not dropping pets because we reached the exit!\n";
#endif
    return;
  }

  for (PetList::iterator it = m_pets.begin(); it != m_pets.end(); ++it)
  {
    Pet* pet = *it;
    pet->SetCarryingPlayer(0);
 
    // Random (x, z) dir
    float rad = Rnd(0, 7.0);  // TODO 2*pi
    Vec3f dir(cos(rad), 0, sin(rad));
    static const float MIN_DROP_SPEED = ROConfig()->GetFloat("pet-min-drop-speed");
    static const float MAX_DROP_SPEED = ROConfig()->GetFloat("pet-max-drop-speed");
    float speed = Rnd(MIN_DROP_SPEED, MAX_DROP_SPEED);
    dir *= speed; 
#ifdef PLAYER_DEBUG
    std::cout << Describe(pet) << " dir: " << Describe(dir) << "\n";
#endif
    pet->SetVel(dir);
  }
  m_pets.clear();
}

void Player::UpdatePets()
{
  float y = m_pos.y + BOTTOM_PET_Y;
  Vec3f posUnder = m_pos;
  for (PetList::iterator it = m_pets.begin(); it != m_pets.end(); 
    /* inc in loop body */)
  {
    Pet* pet = *it;
    Vec3f pos = m_pos; //pet->GetPos();
    Vec3f vel = pet->GetVel();
//    if (pos.y < y) // && vel.y < 0)
    {
      pos.y = y;

      vel.y = 0; //10.0f; // TEST
    }
   
   // Move in dir of player (x, z)
    Vec3f v = (posUnder - pos) * 10.0f;
    vel.x = v.x;
    vel.z = v.z; 
       
    pet->SetVel(Vec3f(0, 0, 0)); //vel);
/*
    Vec3f acc = pet->GetAcc();
    acc.x = -vel.x;
    acc.y = 0;
    acc.z = -vel.z;
    pet->SetAcc(acc);
*/
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
#ifdef PLAYER_DEBUG
std::cout << "Dropping pet " << pet->GetId() << "\n";
#endif
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

RCPtr<Player> s_player[2];

Player* Player::GetPlayer(PlayerNum pn)
{
  return s_player[(int)pn];
}

void Player::SetPlayerId(int playerId)
{
  m_playerId = playerId;

  s_player[playerId] = this;
}

int Player::GetPlayerId() const
{
  return m_playerId;
}

bool Player::Save(File* f)
{
  if (!OnFloorCharacter::Save(f))
  {
    return false;
  }
  f->WriteComment("// Player ID");
  f->WriteInteger(m_playerId);
  f->WriteComment("// MD2 mesh name");
  if (m_md2Name.empty())
  {
    f->ReportError("Player: empty MD2 mesh name! For " + Describe(this));
    return false;
  }

  f->Write(m_md2Name);
  f->WriteComment("// Texture names");
  f->Write(m_texNames[0]);
  f->Write(m_texNames[1]);
  return SaveShadow(f);
}

bool Player::Load(File* f)
{
  if (!OnFloorCharacter::Load(f))
  {
    return false;
  }
  m_startPos = m_pos;

  int playerId = 0;
  if (!f->GetInteger(&playerId))
  {
    f->ReportError("No player ID!?");
    return false;
  }
  SetPlayerId(playerId);

  if (!f->GetDataLine(&m_md2Name))
  {
    f->ReportError("No mesh name for player");
    return false;
  }

  if (!f->GetDataLine(&m_texNames[0]) ||
      !f->GetDataLine(&m_texNames[1]))
  {
    f->ReportError("Failed to get 2 textures for player");
    return false;
  }

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

void Player::OnAnimFinished()
{
  if (IsFalling())
  {
    SetAnim("fall");
  }
}

void Player::Jump()
{
  // Jump if we are on ground or can double jump etc
//  if (!IsFalling())

  if (m_jumpCount < m_maxJumpCount) 
  {
#ifdef PLAYER_DEBUG
std::cout << "JUMP! Count is: " << m_jumpCount << " Vel: " << m_jumpVel << "\n";
#endif

    m_jumpCount++;

    m_vel.y = m_jumpVel; 
    SetIsFalling(true); // jumping == falling
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

  if (be.button == AMJU_BUTTON_A && be.isDown)
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

  if (m_playerId == 0)
  {
    switch (ke.keyType)
    {
    case AMJU_KEY_UP:
////      if (!IsFalling())
      {
        m_vel.z = ke.keyDown ? -MAX_SPEED : 0;
        SetDir(180.0f);
        SetIsControlled(true); 
      }
      return true;

    case AMJU_KEY_DOWN:
////      if (!IsFalling())
      {
        m_vel.z = ke.keyDown ? MAX_SPEED : 0;
        SetDir(0.0f);
        SetIsControlled(true); 
      }
      return true;

    case AMJU_KEY_LEFT:
////      if (!IsFalling())
      {
        m_vel.x = ke.keyDown ? -MAX_SPEED : 0;
        SetDir(-90.0f);
        SetIsControlled(true); 
      }
      return true;

    case AMJU_KEY_RIGHT:
////      if (!IsFalling())
      {
        m_vel.x = ke.keyDown ? MAX_SPEED : 0;
        SetDir(90.0f);
        SetIsControlled(true); 
      }
      return true;

    case AMJU_KEY_SPACE:
      if (ke.keyDown)
      {
        Jump();
      }
      return true;

    default:
      break;
    }
  }
  return false;
}

void Player::SetTiltSensitivity(float x, float y)
{
  m_xSensitivity = x;
  m_ySensitivity = y;
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

//  if (m_wallCollide) /// not: IsFalling())
//  {
//    return false;
//    
//  }

  Vec2f cp = bbe.GetCalibratedCoord();
  float x = cp.x;
  float y = cp.y;
  
#ifdef IPHONE

  const float X_DEAD_ZONE = 0.02f;
  const float Y_DEAD_ZONE = 0.02f;

  const float X_MULT = 2.0f;
  const float Y_MULT = 20.0f;
  
  if (x > -X_DEAD_ZONE && x < X_DEAD_ZONE)
  {
    x = 0;
  }
  else 
  {
    x *= X_MULT * m_xSensitivity;
  }
  
  // y=0 when iphone is horizontal, so compensate for angle at which player is holding iphone
//  y -= OFFSET;
  if (y > -Y_DEAD_ZONE && y < Y_DEAD_ZONE)
  {
    y = 0;
  }
  else 
  {
    y *= Y_MULT * m_ySensitivity;
  }
#endif

////

#ifdef PLAYER_DEBUG
  std::cout << "X: " << x << "\tY: " << y << "\n";
#endif

  Vec3f vel(x * 1.0f * m_velMult, 0, y * 1.0f * m_velMult);

  if (m_wallCollide)
  {
    static const float PUSH_AWAY_VEL = ROConfig()->GetFloat("push-away-speed");
    m_wallCollide = false;
    if (m_wallNormal.x < 0 && vel.x > 0)
    {
      vel.x = -PUSH_AWAY_VEL;
    }
    if (m_wallNormal.x > 0 && vel.x < 0)
    {
      vel.x = PUSH_AWAY_VEL;
    }
  }
  // Not: SetVel(vel);
  m_vel += vel;
  
  // Work out direction to face
  SetDir(RadToDeg(atan2((double)x, (double)y)));

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

////  if (IsFalling())
////  {
////    return false;
////  }

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

////  if (IsFalling())
////  {
////    return false;
////  }

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

bool Player::OnMouseButtonEvent(const MouseButtonEvent& mbe)
{
  if (IsEditMode())
  {
    return false;
  }

  Lurker* lurker = TheLurker::Instance();

  // Tap to jump
  if (mbe.isDown && mbe.button == AMJU_BUTTON_MOUSE_LEFT &&
      !lurker->IsDisplayingMsg() )
  {
    Jump();
  }
  return true;
}

void Player::Update()
{
  float dt = TheTimer::Instance()->GetDt();

  const float MAX_VEL = ROConfig()->GetFloat("max-speed");
  if (m_vel.x > MAX_VEL)
  {
    m_vel.x = MAX_VEL;
  }
  
  if (m_vel.x < -MAX_VEL)
  {
    m_vel.x = -MAX_VEL;
  }
  
  if (m_vel.z > MAX_VEL)
  {
    m_vel.z = MAX_VEL;
  }
  
  if (m_vel.z < -MAX_VEL)
  {
    m_vel.z = -MAX_VEL;
  }
    
  static const float MAX_PLAYER_HEIGHT = ROConfig()->GetFloat("max-player-height");
  float cd = GetCurrentDepth();
  float h = cd + m_pos.y;

  if (h > MAX_PLAYER_HEIGHT)
  {
#ifdef PLAYER_DEBUG
    std::cout << "Player off screen, dead!\n";
#endif
    SetDead(true); // Player off screen
  }

  if (m_reachedExit)
  {
    // Move towards centre of teleporter
    Vec3f v = m_exitPos - m_pos;
    SetVel(v); // TODO
    WWGameObject::Update(); // calc new pos  
  
    Matrix mat;
    mat.RotateY(DegToRad(m_dirCurrent));
    mat.TranslateKeepRotation(m_pos);
    GetSceneNode()->SetLocalTransform(mat);

    UpdateCocoon();
    return;
  }

  OnFloorCharacter::Update();

  if (IsFalling())
  {
    // Probably very annoying
    //if (!m_floor)
    //{
    //   DropPets();
    //}
  }
  else
  {
    m_jumpCount = 0;
  }

  Vec3f v = m_vel;
  v.y = 0;
  float speed = v.SqLen();
  if (IsFalling())
  {
    // TODO fall/jump should be different
    //SetAnim("fall");
  }
  else if (speed > RUN_SPEED)
  {
    SetAnim("run");
  }
  else if (speed > WALK_SPEED)
  {
    SetAnim("walk");
  }
  else if (m_eatenState == NOT_EATEN_YET)
  {
    SetAnim("stand");
  }

  // Set AABB 
  RecalcAABB();

  UpdatePets();

  // Inc score every nth of a second for each carried pet
  if (!m_pets.empty())
  {
    m_petScoreTimer += dt;
    static const float PET_SCORE_MAX_TIME = ROConfig()->GetFloat("pet-score-max-time");
    if (m_petScoreTimer >= PET_SCORE_MAX_TIME)
    {
      m_petScoreTimer = 0;
      static const int CARRYING_MULTIPLIER = ROConfig()->GetInt("carrying-multiplier");
      int bonus = m_pets.size() * CARRYING_MULTIPLIER;
      TheScores::Instance()->AddToScore(static_cast<PlayerNum>(GetPlayerId()), bonus);
    }
  }
 
  // If we have fallen, go to life lost state
  if (IsDead() && !IsEditMode())
  {
    KillController();
    Amju::PlayWav("churchbell"); 

    PlayerNum pn = (PlayerNum)GetPlayerId();
    TheScores::Instance()->DecLives(pn);
    TheHud::Instance()->FlashLives();
    TheLurker::Instance()->Clear();
 
    int lives = TheScores::Instance()->GetLives(pn);

#ifdef PLAYER_DEBUG
std::cout << "Player is dead! Lives left: " << lives << "\n";
#endif
    if (lives == 0)
    {
      TheGame::Instance()->SetCurrentState(TheGSGameOver::Instance());
#ifdef PLAYER_DEBUG
std::cout << "Game over.\n";
#endif
    }
    else
    {
      TheGame::Instance()->SetCurrentState(TheGSLoadLevel::Instance());
#ifdef PLAYER_DEBUG
std::cout << "Loading level...\n";
#endif
    }
  }

  Colour c = ThePowerUpManager::Instance()->GetPlayerColour(GetPlayerId());
  GetSceneNode()->SetColour(c);
}
}
