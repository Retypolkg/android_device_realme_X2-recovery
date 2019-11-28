LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),RMX1991)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
