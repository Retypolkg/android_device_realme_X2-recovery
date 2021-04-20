#
# Copyright (C) 2020 AOSP Project
#
# SPDX-License-Identifier: Apache-2.0
#

BOARD_VENDOR := realme
DEVICE_PATH := device/realme/X2

# Assert
TARGET_OTA_ASSERT_DEVICE := RMX1991,RMX1991CN,RMX1992,RMX1993

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sm6150
TARGET_BOARD_PLATFORM_GPU := qcom-adreno618
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=1 androidboot.usbcontroller=a600000.dwc3 firmware_class.path=/vendor/firmware_mnt/image earlycon=msm_geni_serial,0x880000 loop.max_part=7 cgroup.memory=nokmem,nosocket
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
#BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
#TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/Image.gz-dtb
ifeq ($(strip $(TARGET_PREBUILT_KERNEL)),)
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_SOURCE := kernel/realme/sm7150
TARGET_KERNEL_CONFIG := vendor/RMX1992_defconfig
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
endif

#Init
TARGET_INIT_VENDOR_LIB := libinit_X2
TARGET_RECOVERY_DEVICE_MODULES := libinit_X2

#AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4320133120
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Encryption
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_USES_MKE2FS := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 845
TW_Y_OFFSET := 80
TW_H_OFFSET := -80
TW_NO_SCREEN_BLANK := true
TW_EXCLUDE_TWRPAPP := true
TW_HAS_EDL_MODE := true
TW_OZIP_DECRYPT_KEY := "1c4a11a3a12589ae441a23bb31517733"

#Branding
TW_DEVICE_VERSION := HyperTeam

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

#SHRP
#BUILD_SHRP_REC := true
ifeq ($(strip $(BUILD_SHRP_REC)),)
SHRP_PATH := $(DEVICE_PATH)
SHRP_MAINTAINER := dev-harsh1998
SHRP_DEVICE_CODE := X2
SHRP_FLASH_MAX_BRIGHTNESS := 845
SHRP_EDL_MODE := 1
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb_otg
SHRP_REC := /dev/block/bootdevice/by-name/recovery
SHRP_FLASH := 0
SHRP_REC_TYPE := Treble
SHRP_DEVICE_TYPE := A_Only
endif

#PBRP
#BUILD_PBRP_REC := true
ifeq ($(strip $(BUILD_PBRP_REC)),)
# Highly doubt if these flags exist
TW_USE_QCOM_HAPTICS_VIBRATOR := true
TW_USE_LEDS_HAPTICS := true
endif

#OFRP
#BUILD_OFRP_REC := true
ifeq ($(strip $(BUILD_ORP_REC)),)
TARGET_DEVICE_ALT := "RMX1991, RMX1992, RMX1993"
FOX_REPLACE_BUSYBOX_PS := 1
FOX_REPLACE_TOOLBOX_GETPROP := 1
FOX_USE_TAR_BINARY := 1
FOX_USE_ZIP_BINARY := 1
FOX_USE_NANO_EDITOR := 1
OF_USE_MAGISKBOOT := 1
OF_PATCH_AVB20 := 1
OF_DISABLE_MIUI_SPECIFIC_FEATURES := 1
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1
OF_SCREEN_H := 2340
OF_STATUS_H := 100
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_CLOCK_POS := 1
OF_ALLOW_DISABLE_NAVBAR := 0
FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER := 1
OF_SUPPORT_OZIP_DECRYPTION := 1
endif
