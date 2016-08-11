#include <iostream>
#include <ConfigFile.h>
#include <GuiCheck.h>
#include <SoundManager.h>
#include "GameConsts.h"
#include "GSOptions.h"
#include "WWLoadGui.h"

namespace Amju
{
const char* GSOptions::NAME = "gs-options";

static void OnBack(GuiElement*)
{
  TheGSOptions::Instance()->GoBack();
}

static void OnMusic(GuiCheck* ch, bool value)
{
#ifdef _DEBUG
std::cout << "Music checkbox changed value to: " << value << "\n";
#endif
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  gcf->SetInt(MUSIC_KEY, value);
  gcf->Save();
  TheSoundManager::Instance()->SetSongMaxVolume(value ? 1.0f : 0.0f);
}

static void OnSound(GuiCheck* ch, bool value)
{
#ifdef _DEBUG
std::cout << "Sound checkbox changed value to: " << value << "\n";
#endif
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  gcf->SetInt(SOUND_KEY, value);
  gcf->Save();
  TheSoundManager::Instance()->SetWavMaxVolume(value ? 1.0f : 0.0f);
}

void GSOptions::OnActive()
{
  GSText::OnActive();

  // buttons
  m_gui = WWLoadGui("gui-options.txt");
  Assert(m_gui);
  GetElementByName(m_gui, "back-button")->SetCommand(OnBack);

  // Checkboxes: get previous value from config
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  bool music = gcf->GetInt(MUSIC_KEY);
  bool sound = gcf->GetInt(SOUND_KEY);

  // Checkbox textures 
  Texture* checked = (Texture*)TheResourceManager::Instance()->GetRes("checked.png");
  Texture* unchecked = (Texture*)TheResourceManager::Instance()->GetRes("unchecked.png");

  // Music checkbox 
  GuiCheck* ch = dynamic_cast<GuiCheck*>(GetElementByName(m_gui, "music-check"));
  Assert(ch);
  ch->Set(checked, unchecked); // checked, unchecked textures
  ch->SetOnChangeValue(OnMusic);
  // Set initial value from config 
  ch->SetValue(music);

  // Sound checkbox 
  ch = dynamic_cast<GuiCheck*>(GetElementByName(m_gui, "sound-check"));
  Assert(ch);
  ch->Set(checked, unchecked); // checked, unchecked textures
  ch->SetOnChangeValue(OnSound);
  // Set initial value from config 
  ch->SetValue(sound); 
}
}


