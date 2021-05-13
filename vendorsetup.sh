#
# Copyright (C) 2019 The Android Open Source Project
# Copyright (C) 2019 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

export TARGET_ARCH=arm64
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_NO_MIUI_PATCH_WARNING=1
export FOX_REPLACE_BUSYBOX_PS=1
export FOX_REPLACE_TOOLBOX_GETPROP=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_ZIP_BINARY=1
export FOX_USE_NANO_EDITOR=1
export OF_CLASSIC_LEDS_FUNCTION=0
export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_PATCH_AVB20=1
export OF_USE_GREEN_LED=0
export OF_FLASHLIGHT_ENABLE=0
export OF_MAINTAINER="Retypolkg"
export FOX_VERSION=R11.1
export OF_SCREEN_H=2340
export OF_STATUS_H=100
export OF_STATUS_INDENT_LEFT=48 
export OF_STATUS_INDENT_RIGHT=48
export OF_CLOCK_POS=1
export OF_ALLOW_DISABLE_NAVBAR=0
export TARGET_DEVICE_ALT="RMX1991,RMX1991CN,RMX1992,RMX1993"
export OF_SUPPORT_OZIP_DECRYPTION=1

for var in eng user userdebug; do
  add_lunch_combo omni_X2-$var
done
