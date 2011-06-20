ifeq ($(strip $(AMJULIB_MAC_SCRIPT_PATH)),)
$(error "Please set AMJULIB_MAC_SCRIPT_PATH in your environment.")
endif

RUNDIR		:=	../../Build/CompiledAssets
BUILD		:=	../../Build/Mac
TARGET		:=	$(BUILD)/macgame
AMJU      	:= 	../../../amjulib/Source
SOURCES		:=	../../Source 

LIBS	:= \
	$(AMJULIB_MAC_SCRIPT_PATH)/../../Build/Mac/amjulib.a \
	$(AMJULIB_MAC_SCRIPT_PATH)/../../Source/SoundBass/Bass2.4/Macosx/mp3-free/libbass.dylib \
	$(AMJULIB_MAC_SCRIPT_PATH)/../../Source/SoundBass/Bass2.4/Macosx/libbassmidi.dylib \
	-framework OpenGL \
	-framework GLUT \
	-lstdc++ -lm 

include $(AMJULIB_MAC_SCRIPT_PATH)/GenMakefile

run:
	cp $(TARGET) $(RUNDIR); \
	cp $(AMJU)/SoundBass/Bass2.4/Macosx/libbassmidi.dylib $(RUNDIR); \
	cp $(AMJU)/SoundBass/Bass2.4/Macosx/mp3-free/libbass.dylib $(RUNDIR); \
	cd $(RUNDIR); \
	./macgame


runsetup:
	cp $(TARGET) $(RUNDIR); \
	cp $(AMJU)/SoundBass/Bass2.4/Macosx/libbassmidi.dylib $(RUNDIR); \
	cp $(AMJU)/SoundBass/Bass2.4/Macosx/mp3-free/libbass.dylib $(RUNDIR); 


