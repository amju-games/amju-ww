#include <GuiButton.h>
#include <Game.h>
#include "GSLoadLayers.h"
#include "ProcGen.h"
#include "WWLoadGui.h"
#include "GSTitle.h"

namespace Amju
{
GSLoadLayers::GSLoadLayers()
{
  m_numLayersLoaded = 0;
}

void GSLoadLayers::OnActive()
{
  GSText::OnActive();

  m_gui = WWLoadGui("loadlayers-gui.txt");
  Assert(m_gui);
//  GuiElement* bar = m_gui->GetElementByName("bar");
  // Hide GO button 
//  GuiButton* go = (GuiButton*)m_gui->GetElementByName("go-button");
//  Assert(go);
//  go->SetVisible(false);

  TheProcGen::Instance()->Init();
  
}

void GSLoadLayers::OnDeactive()
{
}

void GSLoadLayers::Update()
{
  ProcGen* pg = TheProcGen::Instance();
  pg->OpenLayer(m_numLayersLoaded + 1);
  while (!pg->IsLayerLoaded())
  {
    pg->LoadLayerObject();
  }
  pg->CloseLayer();
  m_numLayersLoaded++;

  if (m_numLayersLoaded == pg->GetNumLayers())
  {
    // Done
    TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());
  }
}

void GSLoadLayers::Draw2d()
{
  GSText::Draw2d();
}

void GSLoadLayers::Draw()
{
}

}

