#include <AmjuFirst.h>
#include <AmjuGL.h>
#include <StringUtils.h>
#include <Directory.h>
#include <GlueFile.h>
#include <FileImplGlue.h>
#include <Game.h>
#include <AmjuTime.h>
#include <Pause.h>
#include <CursorManager.h>
#include "GSCopyAssets.h"
#include "GSLogo.h"
#include "SaveDir.h"
#include <AmjuFinal.h>

#if defined(WIN32) && defined(_DEBUG)
//#define WIN32_TEST_COPY_ASSETS
#endif

#define FILECOPY_DEBUG

namespace Amju
{
bool CopyFromGlueFile(const std::string& destDir)
{
  // The glue file has already been loaded into mem
  GlueFile* gf = FileImplGlue::GetGlueFile();
  Assert(gf);
  const std::string& srcGlueFilePath = gf->GetFilename();

std::cout << "Glue file + path: '" << srcGlueFilePath << "'\n";

//  std::string oldRoot = File::GetRoot();
//  File::SetRoot("", "/");
//  GlueFile gf;
//  bool loaded = gf.OpenGlueFile(srcGlueFilePath, true);
//  File::SetRoot(oldRoot, "/");
//  if (!loaded)
//  {
//    std::cout << "Failed to open glue file " << srcGlueFilePath << "\n";
//    Assert(0);
//    return false;
//  }

  Time glueTime = GetFileModifiedTime(srcGlueFilePath);

  Strings strs;
  gf->Dir(&strs);
  int size = strs.size();
  for (int i = 0; i < size; i++)
  {
    const std::string& subfile = strs[i];
#ifdef FILECOPY_DEBUG
    std::cout << "Found file " << subfile << " from glue file...  ";
#endif

    if (subfile == "roconfig.txt" || subfile.substr(0, 6) == "levels")
    {
std::cout << "We DO want to copy this file!\n";
    }
    else
    {
std::cout << "...Skipping.\n";
      continue;
    }

    std::string outFileName = destDir + subfile;
    // Check if we should copy file - we should if it does not exist, or
    //  timestamp of glue file is more recent than the file.
    bool doCopy = true;

    if (FileExists(outFileName))
    {
#ifdef FILECOPY_DEBUG
std::cout << "File already exists: " << outFileName << "\n";
#endif
      Time destTime = GetFileModifiedTime(outFileName);

      if (!(destTime < glueTime))
      {
#ifdef FILECOPY_DEBUG
std::cout << "  Don't copy, OS file is more recent than glue file.\n";
#endif
        doCopy = false; // more recent copy already there
      }
    }

    if (doCopy)
    {
      unsigned int seekbase = 0;
      if (!gf->GetSeekBase(subfile, &seekbase))
      {
        std::cout << "Failed to find subfile " << subfile << " in glue file, but was listed in Dir!!\n";
        Assert(0);
        return false;
      }
      uint32 size = gf->GetSize(subfile);
      unsigned char* buf = new unsigned char[size + 1];
      gf->GetBinary(seekbase, size, buf);

      File outFile(false, File::STD); // no version info
      std::string outFileDir = GetFilePath(outFileName);
      if (!MkDir(outFileDir))
      {
        std::cout << "MkDir failed: " << outFileDir << "\n";
        Assert(0);
        return false;
      }
std::cout << "Attempting to open file for writing: '" << outFileName << "'\n";
      if (!outFile.OpenWrite(outFileName, 
        0, // version
        true, // is binary
        false, // use root
        true // truncate 
      ))
      {
        std::cout << "Failed to open file " << outFileName << " for writing.\n";
        Assert(0);
        return false;
      }
      if (!outFile.WriteBinary((char*)buf, size))
      {
        std::cout << "Failed to write binary data to " << outFileName << ", size: " << size << "\n";
        Assert(0);
        return false;
      }
      delete [] buf; // whoops
    } // if doCopy
  } // next file in glue file
  return true;
}

GSCopyAssets::GSCopyAssets()
{
}

void GSCopyAssets::Update()
{
  // Counter so we draw window before copying
  static int done = 0;
  done++;
  if (done == 2)
  {
    std::cout << "Copying files to Save Dir as required...\n";
      
    static std::string saveDir = GetSaveDir(); 

std::cout << "\nSave Dir: " << saveDir << "\n";

    CopyFromGlueFile(saveDir);
      
    // All copied - go to next state 
    TheGame::Instance()->SetCurrentState(TheGSLogo::Instance());
  }
}

void GSCopyAssets::Draw()
{
}

void GSCopyAssets::Draw2d()
{
}

void GSCopyAssets::OnActive()
{
  GameState::OnActive();

  // Before loading anything, copy the files necessary to show logo or 'please wait' indicator.
  AmjuGL::SetClearColour(Colour(0, 0, 0, 1));
}

} // namespace
