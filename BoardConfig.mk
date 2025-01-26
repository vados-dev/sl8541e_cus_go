#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/sprd/sl8541e_cus_go

# PBRP specific build flags
#PB_DISABLE_DEFAULT_DM_VERITY := true

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic 
TARGET_CPU_VARIANT_RUNTIME := cortex-a53
TARGET_CPU_SMP := true

# ?
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

TARGET_USES_64_BIT_BINDER := true

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sl8541e_cus_32b
TARGET_NO_BOOTLOADER := true

# Display
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
# Old option:
#DEVICE_RESOLUTION := 1280x320
TW_IGNORE_MAJOR_AXIS_0 := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
#TARGET_SCREEN_DENSITY := 320
# Touchscreen based on landscape screen but TWRP displays portraitly
# This option makes touchscreen portrait 
RECOVERY_TOUCHSCREEN_SWAP_XY:= true
# This option flips the value of touch x-axis
RECOVERY_TOUCHSCREEN_FLIP_X:= true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x05400000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_CONFIG := sprd_sharkle_defconfig
TARGET_KERNEL_SOURCE := kernel/sprd/sl8541e_cus_go

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
# path to a prebuild kernel (can be used if you are unable to compile a kernel yourself, e.g. if no kernel source available)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DT := $(DEVICE_PATH)/prebuilt/dt.img
BOARD_MKBOOTIMG_ARGS += --dt $(TARGET_PREBUILT_DT)
BOARD_KERNEL_SEPARATED_DT := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 36700160
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 36700160
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 28462529536
#BOARD_CACHEIMAGE_PARTITION_SIZE := 157286400
#BOARD_PERSISTIMAGE_PARTITION_SIZE := 2097152
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Platform
TARGET_BOARD_PLATFORM := sp9832e
#TARGET_BOARD_PLATFORM_GPU := mali-t820

# Enable CPUSets
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Fuse
TW_INCLUDE_NTFS_3G    := true
# exFAT FS Support
TW_INCLUDE_FUSE_EXFAT := true
# NTFS Support
TW_INCLUDE_FUSE_NTFS := true


# Crypto
TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_CRYPTO_FBE := true
#TW_INCLUDE_FBE_METADATA_DECRYPT := true
#BOARD_USES_METADATA_PARTITION := true

# Encryption by Depesh
#TARGET_HW_DISK_ENCRYPTION := true
#TW_CRYPTO_FS_TYPE := "f2fs"
#TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/soc/soc:ap-ahb/20600000.sdio/by-name/userdata"
#TW_CRYPTO_MNT_POINT := "/data"
#TW_CRYPTO_FS_OPTIONS := "noatime,nosuid,nodev,discard,inline_xattr,inline_data=ordered"

# system.prop
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Verified Boot
#BOARD_AVB_ENABLE := true
#BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
#BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
#BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
#BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
#BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# Resolution
DEVICE_SCREEN_WIDTH := 1280
DEVICE_SCREEN_HEIGHT := 320

#TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/devices/platform/sprd_backlight/backlight/sprd_backlight/brightness\"
HAVE_SELINUX := true
RECOVERY_SDCARD_ON_DATA := true

# TWRP Configuration
#RECOVERY_VARIANT := twrp
# TWRP specific build flags by Depesh
TW_BRIGHTNESS_PATH := "/sys/devices/platform/sprd_backlight/backlight/sprd_backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 200
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := ru
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
#TW_NO_LEGACY_PROPS := true
TW_USE_TOOLBOX := true
# some devices don't have a temp sensor, disable in such case to stop spamming recovery.log
#TW_NO_CPU_TEMP := true
# system won't be unmounted,
TW_NEVER_UNMOUNT_SYSTEM := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
#TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery.fstab
#TW_NO_SCREEN_BLANK := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_USES_SPRD_HARDWARE := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
#TW_FORCE_USE_BUSYBOX := true
TW_USE_NEW_MINADBD := true

# Libresetprop & resetprop
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true

# Exludes
# don't include default init.recovery.usb.rc, provide your own or use needed defines inside init.recovery.$DEVICE.rc
TW_EXCLUDE_DEFAULT_USB_INIT := true

#PIE
#PLATFORM_SDK_VERSION := 28

# Debug
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# Fuse
TW_INCLUDE_NTFS_3G    := true
# exFAT FS Support
TW_INCLUDE_FUSE_EXFAT := true
# NTFS Support
TW_INCLUDE_FUSE_NTFS := true
# Use MKE2FS NTFS_3G to create ext4 images
TARGET_USES_MKE2FS := true

# Storage
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

# Show build time on the splash screen
TW_DEVICE_VERSION := $(shell date '+%Y%m%d')" by vados-dev"
