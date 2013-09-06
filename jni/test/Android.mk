LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_CFLAGS := -D__STDC_CONSTANT_MACROS -Wno-sign-compare -Wno-switch -Wno-pointer-sign -DHAVE_NEON=1 \
		-mfpu=neon -mfloat-abi=softfp -fPIC -DANDROID

ifeq ($(PREBUILT_TYPE), static)
LOCAL_MODULE := ffmpeg_test_static
else
LOCAL_MODULE := ffmpeg_test_shared
endif

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/../ffmpeg \

LOCAL_SRC_FILES := \
	src/test.c
#	src/ffmpeg_test.c

LOCAL_STATIC_LIBRARIES := libavformat libavcodec libavdevice libavfilter libavutil libswscale libswresample

LOCAL_LDLIBS :=-L$(NDK_PLATFORMS_ROOT)/$(TARGET_PLATFORM)/arch-arm/usr/lib \
      -L$(LOCAL_PATH)/../prebuilts/libs-static  -lavformat -lavcodec -lavdevice -lavfilter -lavutil \
      -lswscale -lswresample -llog -lz -ldl -lgcc


#include $(BUILD_STATIC_LIBRARY)
include $(BUILD_SHARED_LIBRARY)
