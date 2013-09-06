LOCAL_PATH := $(call my-dir)
MY_APP_PATH := $(LOCAL_PATH)

PREBUILT_TYPE := static

include $(CLEAR_VARS)

ifeq ($(PREBUILT_TYPE), static)
include prebuilts/libs-static/Android.mk
else
include prebuilts/libs-shared/Android.mk
endif

include $(MY_APP_PATH)/test/Android.mk 
