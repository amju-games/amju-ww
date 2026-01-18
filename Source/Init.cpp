#include <GameObjectFactory.h>
#include <CollisionManager.h>
#include "Init.h"
#include "Bird.h"
#include "Block.h"
#include "Bonus.h"
#include "Camera.h"
#include "Deadly.h"
#include "Dino.h"
#include "Exit.h"
#include "Fence.h"
#include "Floor.h"
#include "Objective.h"
#include "Pet.h"
#include "Player.h"
#include "Portal.h"
#include "Skybox.h"
#include "StaticFloor.h"
#include "TutorialTrigger.h"
#include "CollideDinoDino.h"
#include "CollideDinoPet.h"
#include "CollideObjectFence.h"
#include "CollideObjectFloor.h"
#include "CollidePetPet.h"
#include "CollidePlayerBlock.h"
#include "CollidePlayerBonus.h"
#include "CollidePlayerDeadly.h"
#include "CollidePlayerDino.h"
#include "CollidePlayerExit.h"
#include "CollidePlayerPet.h"
#include "CollidePlayerPlayer.h"
#include "CollidePlayerTrigger.h"

namespace Amju
{

template<class T>
GameObject* Create() { return new T; } 

void Init()
{
  auto* gof = TheGameObjectFactory::Instance();
  
  gof->Add(Bird::NAME, &Create<Bird>);
  gof->Add(Block::NAME, &Create<Block>);
  gof->Add(Bonus::NAME, &Create<Bonus>);
  gof->Add(Camera::NAME, Create<Camera>);
  gof->Add(Deadly::NAME, &Create<Deadly>);
  gof->Add(Dino::NAME, &Create<Dino>);
  gof->Add(Exit::NAME, &Create<Exit>);
  gof->Add(Fence::NAME, &Create<Fence>);
  gof->Add(Floor::NAME, &Create<Floor>);
  gof->Add(Objective::NAME, &Create<Objective>);
  gof->Add(Pet::NAME, &Create<Pet>);
  gof->Add(Player::NAME, &Create<Player>);
  gof->Add(Portal::NAME, &Create<Portal>);
  gof->Add(Skybox::NAME, &Create<Skybox>);
  gof->Add(StaticFloor::NAME, &Create<StaticFloor>);
  gof->Add(TutorialTrigger::NAME, &Create<TutorialTrigger>);

  auto cm = TheCollisionManager::Instance();

  cm->Add(Dino::NAME, Dino::NAME, &CollideDinoDino, AMJU_EVERY_CONTACT);
  cm->Add(Dino::NAME, Pet::NAME, CollideDinoPet, AMJU_EVERY_CONTACT);
  cm->Add(Dino::NAME, Player::NAME, CollideDinoPet, AMJU_EVERY_CONTACT);
  cm->Add(Player::NAME, Fence::NAME, &CollideObjectFence, AMJU_EVERY_CONTACT);
  cm->Add(Dino::NAME, Fence::NAME, &CollideObjectFence, AMJU_EVERY_CONTACT);
  cm->Add(Pet::NAME, Fence::NAME, &CollideObjectFence, AMJU_EVERY_CONTACT);

  bool contactType = AMJU_EVERY_CONTACT;
  cm->Add(Player::NAME, Floor::NAME, &CollideObjectFloor, contactType);
  cm->Add(Dino::NAME, Floor::NAME, &CollideObjectFloor, contactType);
  cm->Add(Pet::NAME, Floor::NAME, &CollideObjectFloor, contactType);
  cm->Add(Player::NAME, StaticFloor::NAME, &CollideObjectFloor, contactType);
  cm->Add(Dino::NAME, StaticFloor::NAME, &CollideObjectFloor, contactType);
  cm->Add(Pet::NAME, StaticFloor::NAME, &CollideObjectFloor, contactType);

  cm->Add(Pet::NAME, Pet::NAME, &CollidePetPet, AMJU_FIRST_CONTACT_ONLY);
  cm->Add(Player::NAME, Block::NAME, &CollidePlayerBlock, AMJU_FIRST_CONTACT_ONLY);
  cm->Add(Player::NAME, Bonus::NAME, &CollidePlayerBonus, AMJU_FIRST_CONTACT_ONLY);
  cm->Add(Player::NAME, Deadly::NAME, CollidePlayerDeadly, AMJU_EVERY_CONTACT);
  // Trying a different design, Dinos can eat Player, so using Pet/Dino
  //cm->Add(Player::NAME, Dino::NAME, CollidePlayerDino, AMJU_FIRST_CONTACT_ONLY);
  cm->Add(Player::NAME, Exit::NAME, CollidePlayerExit, AMJU_FIRST_CONTACT_ONLY);
  cm->Add(Player::NAME, Pet::NAME, &CollidePlayerPet, AMJU_FIRST_CONTACT_ONLY);
  cm->Add(Player::NAME, Player::NAME, &CollidePlayerPlayer, AMJU_EVERY_CONTACT);
  cm->Add(Player::NAME, TutorialTrigger::NAME, CollidePlayerTrigger, AMJU_FIRST_CONTACT_ONLY);
  // Portals are Triggers too
  cm->Add(Player::NAME, Portal::NAME, CollidePlayerTrigger, AMJU_FIRST_CONTACT_ONLY);

}
}
