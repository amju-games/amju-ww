#ifndef GS_COPYASSETS_H_INCLUDED
#define GS_COPYASSETS_H_INCLUDED

#include <Singleton.h>
#include <GameState.h>

namespace Amju 
{
// Copy level files from the glue file to the Save Dir.
// When we load levels we load from the file in the Save Dir, not from the
//  glue file. This lets us save changes and download level files.
// Also the read only config file is extracted so we can download updates.

class GSCopyAssets : public GameState
{
  GSCopyAssets();
  friend class Singleton<GSCopyAssets>;

public:
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();

};
typedef Singleton<GSCopyAssets> TheGSCopyAssets;
} // namespace
#endif
