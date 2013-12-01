#!/usr/bin/perl -w

# Create boilerplate code for GUI-based class


# Main function starts here
if ($#ARGV != 0)  # !?! size - 1
{
  print "Usage: newgui <statename> e.g. Lighting creates GSLighting.h, cpp\n";
  exit(0);
}

my $dotH = "GS" . $ARGV[0] . ".h";
my $dotCpp = "GS" . $ARGV[0] . ".cpp";
my $upper = uc($ARGV[0]);
my $guard = "GS_" . $upper . "_H_INCLUDED";
my $class = "GS" . $ARGV[0];
my $scope = $class . "::";

open (DOT_H, ">$dotH");

print DOT_H "#pragma once\
\n\
#include <Singleton.h>\
#include \"GSText.h\"\n\
namespace Amju \
{\
class $class : public GSText\
{\
  $class();\
  friend class Singleton<$class>;\
\
public:\
  virtual void Update();\
  virtual void Draw();\
  virtual void Draw2d();\
  virtual void OnActive();\
\
};\
typedef Singleton<$class> The$class;\
} // namespace\
\n";

close (DOT_H);

open (DOT_CPP, ">$dotCpp");

print DOT_CPP "#include \"$dotH\"\
#include <AmjuGL.h>\
#include \"WWLoadGui.h\"\
\
namespace Amju\
{\n" . $scope . $class . "()\
{\
}\
\
void " . $scope . "Update()\
{\
  GSText::Update();\
\
}\
\
void " . $scope . "Draw()\
{\
  GSText::Draw();\
\
}\
\
void " . $scope . "Draw2d()\
{\
  GSText::Draw2d();\
}\
\
void " . $scope . "OnActive()\
{\
  GSText::OnActive();\
\
  m_gui = WWLoadGui(\"TODO\");\
  Assert(m_gui);\
\
  // TODO Set focus element, cancel element, command handlers\
}\
\
} // namespace\n";

close (DOT_CPP);

