ifeq ($(strip $(AMJULIB_WII_SCRIPT_PATH)),)
$(error "Please set AMJULIB_WII_SCRIPT_PATH in your environment.")
endif

BUILD		:=	../../Build/Wii
TARGET		:=	$(BUILD)/boot
#AMJU      	:= 	../../../amjulib/Source
LIBDIRS   	:= 	../../Libs/amjulib-v.0.3-wii


SOURCES		:=	../../Source 

include $(AMJULIB_WII_SCRIPT_PATH)/GenMakefile


