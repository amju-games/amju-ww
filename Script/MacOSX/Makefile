ifeq ($(strip $(AMJULIB_MAC_SCRIPT_PATH)),)
$(error "Please set AMJULIB_MAC_SCRIPT_PATH in your environment.")
endif

RUNDIR		:=	../../Build/CompiledAssets
BUILD		:=	../../Build/Mac
TARGET		:=	$(BUILD)/macgame
LIBDIRS   	:= 	../../../amjulib/Releases/amjulib-v.0.5-macosx
SOURCES		:=	../../Source 
BASSPATH	:=	$(AMJULIB_MAC_SCRIPT_PATH)/../../Source/SoundBass/Bass2.4/Macosx

LIBS	:= \
	-lamju \
	$(BASSPATH)/mp3-free/libbass.dylib \
	$(BASSPATH)/libbassmidi.dylib \
	-framework OpenGL \
	-framework GLUT \
	-framework Carbon \
	-lstdc++ -lm 

include $(AMJULIB_MAC_SCRIPT_PATH)/GenMakefile

run:
	cp $(TARGET) $(RUNDIR); \
	cp $(BASSPATH)/libbassmidi.dylib $(RUNDIR); \
	cp $(BASSPATH)/mp3-free/libbass.dylib $(RUNDIR); \
	cd $(RUNDIR); \
	./macgame


runsetup:
	cp $(TARGET) $(RUNDIR); \
	cp $(BASSPATH)/libbassmidi.dylib $(RUNDIR); \
	cp $(BASSPATH)/mp3-free/libbass.dylib $(RUNDIR); 


