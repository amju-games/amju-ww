# Amju Rainbow Drop for Android 
# Jason Colman 2014


LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
LOCAL_MODULE := amju-prebuilt
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../../Libs/amjulib-v.0.3-android/lib/armeabi/libamju.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE    := amju-ww

# override not supported?
LOCAL_CFLAGS := -std=c++0x -DANDROID_NDK \
				-DPVRSDK \
				-Doverride= 


LOCAL_C_INCLUDES := \
	../../../Source\
	../../../Libs/amjulib-v.0.3-android/include

# Oh yeah. Create list of all .cpp files in above directory list.
LOCAL_SRC_FILES := \
	$(foreach dir,$(LOCAL_C_INCLUDES),$(wildcard $(dir)/*.cpp)) 

#LOCAL_LDFLAGS += \
#	-L../../../Libs/amjulib-v.0.3-android/lib/armeabi 

LOCAL_STATIC_LIBRARIES := amju-prebuilt

LOCAL_LDLIBS := -lz -lGLESv1_CM -ldl -llog

include $(BUILD_SHARED_LIBRARY)

