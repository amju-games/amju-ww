#include <File.h>
#include <GameObjectFactory.h>
#include <Localise.h>
#include <ROConfig.h>
#include "TutorialTrigger.h"
#include "LurkMsg.h"
#include "GameMode.h"
#include "PlayWav.h"

namespace Amju
{
const char* TutorialTrigger::NAME = "tut-trigger";

GameObject* CreateTT() { return new TutorialTrigger; }
static bool reg = TheGameObjectFactory::Instance()->Add(TutorialTrigger::NAME, &CreateTT);

TutorialTrigger::TutorialTrigger()
{
  m_hasShownText = false;
}

WWGameObject* TutorialTrigger::Clone()
{
  return new TutorialTrigger(*this);
}

const char* TutorialTrigger::GetTypeName() const
{
  return NAME;
}

void TutorialTrigger::OnPlayerCollision(Player*)
{
  if (!m_hasShownText)
  {
    if (!IsEditMode()) // Edit mode "fix" - TODO
    {
      static std::string sound = ROConfig()->GetValue("sound-tut-trigger");
      PlayWav(sound);

      Strings strs = Split(m_text, '&'); 
      for (auto it = strs.begin(); it != strs.end(); ++it)
      {
        const std::string& s = *it;
        LurkMsg lm(Lookup(s), Colour(1, 1, 1, 1), Colour(0, 0, 0, 1), 
          AMJU_CENTRE);
        TheLurker::Instance()->Queue(lm);
      }
    }
    m_hasShownText = true;
  }
}

bool TutorialTrigger::Save(File* f)
{
  if (!Trigger::Save(f))
  {
    return false;
  }
  return f->WriteComment("// Tutorial text") &&
    f->Write(m_text.empty() ? "$$$empty" : m_text);
}

bool TutorialTrigger::Load(File* f)
{
  if (!Trigger::Load(f))
  {
    return false;
  }
  // Get tutorial text - NB should be localised
  if (!f->GetDataLine(&m_text))
  {
    f->ReportError("Expected tutorial text");
    return false;
  }
  return true;
}
}

