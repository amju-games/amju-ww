#include "TutorialTrigger.h"
#include "Tutorial.h"
#include <File.h>
#include <GameObjectFactory.h>

namespace Amju
{
const char* TutorialTrigger::NAME = "tut-trigger";

GameObject* CreateTT() { return new TutorialTrigger; }
static bool reg = TheGameObjectFactory::Instance()->Add(TutorialTrigger::NAME, &CreateTT);

TutorialTrigger::TutorialTrigger()
{
  m_hasShownText = false;
}

const char* TutorialTrigger::GetTypeName() const
{
  return NAME;
}

void TutorialTrigger::OnPlayerCollision(Player*)
{
  if (!m_hasShownText)
  {
    TheTutorial::Instance()->SetText(m_text);
    m_hasShownText = true;
  }
}

bool TutorialTrigger::Load(File* f)
{
  if (!Trigger::Load(f))
  {
    return false;
  }
  // Get tutorial text - NB should be localised
  if (!f->GetLocalisedString(&m_text))
  {
    f->ReportError("Expected tutorial text");
    return false;
  }
  return true;
}
}

