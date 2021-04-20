#
# Copyright (C) 2020 AOSP Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := \
    system/core/base/include \
    system/core/init
LOCAL_SRC_FILES := init_X2.cpp
LOCAL_MODULE := libinit_X2

include $(BUILD_STATIC_LIBRARY)
