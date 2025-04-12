#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
#Unified TWRP Tree for a11
#include device/android/common/BoardConfigCommon.mk

DEVICE_PATH := device/sprd/sl8541e_cus_go
# system.prop
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

#BOARD_SEPOLICY_VERS := 27
#PLATFORM_SDK_VERSION := 27

TARGET_BOARD_VENDOR := sprd

#BOARD_SEPOLICY_DIRS += vendor/sprd/generic/sepolicy
#BOARD_SEPOLICY_DIRS += device/sprd/sl8541e_cus_go/sepolicy
#BOARD_SEPOLICY_DIRS += vendor/sprd/proprietories-source/sprdtrusty/vendor/sprd/modules/common/sepolicy
#BOARD_SEPOLICY_DIRS += vendor/sprd/proprietories-source/sprdtrusty/vendor/sprd/modules/ifaa/sepolicy_androido

#BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/sprd/sharkle/common/plat_sepolicy/private
#BOARD_PLAT_PUBLIC_SEPOLICY_DIR += device/sprd/sharkle/common/plat_sepolicy/public

#CHIP_NAME  := sharkle

#include device/sprd/sharkle/common/cust_android.mk
# PBRP specific build flags
PB_DISABLE_DEFAULT_DM_VERITY := true

LC_ALL=C

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_DUP_RULES := true

# ota releasetools extensions
#TARGET_RECOVERY_UPDATER_LIBS := libsprd_updater

#TARGET_OTA_EXTENSIONS_DIR := vendor/sprd/tools/ota
#TARGET_RELEASETOOLS_EXTENSIONS := $(TARGET_OTA_EXTENSIONS_DIR)
# A/B
#TARGET_NO_KERNEL := false
#AB_OTA_UPDATER := true
#TARGET_RECOVERY_QCOM_RTC_FIX := true
#AB_OTA_PARTITIONS += \
#    system \
#    vendor \
#    vbmeta \
#    boot \
#    recovery 
#    prodnv

FORCE_32_BIT := true
# Architecture
ifeq ($(FORCE_32_BIT),true)
TARGET_ARCH := arm
#TARGET_ARCH_VARIANT := armv8-a
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53
else
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
endif

TARGET_CPU_CORTEX_A53 := true

#chipram tool for arm64
#TOOLCHAIN_64 := true

TARGET_USES_64_BIT_BINDER := true
#TARGET_USES_UEFI := true

#TARGET_OTA_ASSERT_DEVICE := sl8541e_cus_go

TARGET_CPU_SMP := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

#ARCH_ARM_HAVE_VFP := true
#ARCH_ARM_HAVE_NEON := true
#ARCH_ARM_HAVE_TLS_REGISTER := true

# HIDL
#DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/recovery/root/vendor/manifest.xml
#DEVICE_MATRIX_FILE := $(DEVICE_PATH)/recovery/root/vendor/compatibility_matrix.xml

# VINTF
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true
PRODUCT_ENFORCE_VINTF_MANIFEST := true
#secure boot
BOARD_SECBOOT_CONFIG := true

#add for sunwave fingerprint
#BOARD_FINGERPRINT_CONFIG := sunwave

#BOARD_ATF_BOOT_TOS_CONFIG := true

BOARD_TEE_CONFIG := trusty
TRUSTY_PRODUCTION := true
#trusty related config
#CFG_TRUSTY_DEFAULT_PROJECT := sharkle

#TRUSTY_SEPOLICY_DIR := vendor/sprd/proprietories-source/sprdtrusty/vendor/sprd/modules/common/sepolicy_androido
#BOARD_SEPOLICY_DIRS += $(TRUSTY_SEPOLICY_DIR)

#PowerHint HAL
#POWERHINT_PRODUCT_CONFIG := sharkle
# select sensor
#USE_SPRD_SENSOR_LIB := true

#BOARD_HAVE_ACC := Bma253
#BOARD_ACC_INSTALL := 1
#BOARD_HAVE_ORI := akm099xx
#BOARD_ORI_INSTALL := NULL
#BOARD_HAVE_PLS := LTR558ALS
#BOARD_PLS_COMPATIBLE := true

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := sl8541e_cus_32b

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 36700160
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 36700160
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28462529536
BOARD_CACHEIMAGE_PARTITION_SIZE := 157286400
BOARD_PERSISTIMAGE_PARTITION_SIZE := 2097152
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VENDORIMAGE_PARTITION_SIZE := 314572800

BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor
#TARGET_COPY_OUT_PRODUCT := product

# Kernel
TARGET_KERNEL_ARCH := arm
BOARD_BOOTIMG_HEADER_VERSION := 0
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := earlycon=sprd_serial,0x508d0000,115200n8 console=ttyS0,115200n8
BOARD_KERNEL_CMDLINE += init=/init root=/dev/ram0 rw
BOARD_KERNEL_CMDLINE += androidboot.hardware=sl8541e_cus_go
BOARD_KERNEL_CMDLINE += vmalloc=360M
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.usbconfigfs=true
BOARD_KERNEL_CMDLINE += androidboot.vbmeta.device=PARTUUID=1.0
BOARD_KERNEL_CMDLINE += androidboot.vbmeta.avb_version=1.0
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x05400000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_SEPARATED_DT := true
#BOARD_KERNEL_IMAGE_NAME := Image
#BOARD_INCLUDE_DTB_IN_BOOTIMG := true
#BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_KERNEL_CONFIG := sprd_cus_go_defconfig
TARGET_KERNEL_SOURCE := kernel/sprd

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
# path to a prebuild kernel (can be used if you are unable to compile a kernel yourself, e.g. if no kernel source available)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DT := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dt $(TARGET_PREBUILT_DT)
#BOARD_INCLUDE_DTB_IN_BOOTIMG :=
BOARD_KERNEL_SEPARATED_DT := 
endif

# Platform
TARGET_BOARD_PLATFORM := sp9832e
TARGET_BOARD_PLATFORM_GPU := midgard

# GPU
#TARGET_GPU_PLATFORM := midgard
#MALI_PLATFORM_NAME := sharkle

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_USES_SPRD_HARDWARE := true

#for dynamic partitions feature
#BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true
#BOARD_SUPER_PARTITION_SIZE :=2621440000
#BOARD_SUPER_PARTITION_GROUPS := group_unisoc
#BOARD_GROUP_UNISOC_SIZE := 2621440000
#BOARD_GROUP_UNISOC_PARTITION_LIST := system vendor

#!!! Security patch level ORIG !!!
#VENDOR_SECURITY_PATCH := 2018-09-05
#PLATFORM_SECURITY_PATCH := 2018-09-05

#!!! Security patch level TWRPDGEN !!!
VENDOR_SECURITY_PATCH := 2021-08-01

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_KEY_PATH := $(BOARD_AVB_KEY_PATH)
#BOARD_AVB_BOOT_KEY_PATH := $(BOARD_AVB_KEY_PATH)
BOARD_AVB_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ALGORITHM := $(BOARD_AVB_ALGORITHM)
#BOARD_AVB_BOOT_ALGORITHM := $(BOARD_AVB_ALGORITHM)
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1 
#BOARD_AVB_BOOT_ROLLBACK_INDEX := $(BOARD_AVB_ROLLBACK_INDEX)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
#BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 1

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

BOARD_ROOT_EXTRA_FOLDERS += productinfo external_sd
#BOARD_USES_RECOVERY_AS_BOOT := true
#TARGET_NO_RECOVERY := true
#TW_HAS_NO_RECOVERY_PARTITION := true

# Crypto
#TW_INCLUDE_CRYPTO := true
#HAVE_CAPABILITIES := true
#CONFIG_HW_DISK_ENCRYPTION := true
#TW_INCLUDE_CRYPTO_FBE := true
#BOARD_USES_METADATA_PARTITION := true
#TW_INCLUDE_FBE_METADATA_DECRYPT := true
#TW_USE_FSCRYPT_POLICY := 2
#TW_PREPARE_DATA_MEDIA_EARLY := true

# Generic AOSP image does NOT support HWC1
#TARGET_USES_HWC2 := true

# Display
TARGET_SCREEN_DENSITY := 320

#ANDROID_VOLD_CRYPTFS
TW_CRYPTO_USE_SYSTEM_VOLD := true 
#hwservicemanager servicemanager vndservicemanager keymaster-3-0 gatekeeper-1-0 storageproxyd
#uncrypt resize2fs vdc vold hwservicemanager vndservicemanager keymaster-3-0 gatekeeper-1-0 storageproxyd
# qseecomd keymaster-3-0-qti
TW_CRYPTO_SYSTEM_VOLD_MOUNT := vendor
#TW_CRYPTO_SYSTEM_VOLD_DEBUG := true
#BOARD_VOLD_EMMC_SHARES_DE5V_MAJOR := true

# Encryption by Depesh
#PLATFORM_SECURITY_PATCH := 2025-12-31
#TARGET_HW_DISK_ENCRYPTION := true
#TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw
#TW_CRYPTO_FS_TYPE := "f2fs"
#TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/soc/soc:ap-ahb/20600000.sdio/by-name/userdata"
#TW_CRYPTO_MNT_POINT := "/data"
#TW_CRYPTO_FS_OPTIONS := "noatime,nosuid,nodev,discard,inline_xattr,inline_data=ordered"

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
TARGET_USES_MKE2FS := true
#TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/etc/recovery.fstab
#TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery.fstab
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
BOARD_HAS_LARGE_FILESYSTEM := true
#TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/root/etc/init.rc

BOARD_HAS_REMOVABLE_STORAGE := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.gs6/lun.%d/file

# Display
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
# Old option:
#DEVICE_RESOLUTION := 1280x320
TW_IGNORE_MAJOR_AXIS_0 := true
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
#TARGET_SCREEN_DENSITY := 240
# Touchscreen based on landscape screen but TWRP displays portraitly
# This option makes touchscreen portrait 
RECOVERY_TOUCHSCREEN_SWAP_XY:= true
# This option flips the value of touch x-axis
RECOVERY_TOUCHSCREEN_FLIP_X:= true

# Resolution
DEVICE_SCREEN_WIDTH := 1280
DEVICE_SCREEN_HEIGHT := 320
BOARD_HAS_FLIPPED_SCREEN := true
TW_BRIGHTNESS_PATH := "/sys/devices/platform/sprd_backlight/backlight/sprd_backlight/brightness"
TW_MAX_BRIGHTNESS := 125
TW_DEFAULT_BRIGHTNESS := 95

TW_HAS_MTP := true
TW_MTP_DEVICE := /dev/mtp_usb

# TWRP Configuration
#RECOVERY_VARIANT := twrp
# TWRP specific build flags by Depesh
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/devices/platform/sprd_backlight/backlight/sprd_backlight/brightness\"
#TARGET_RECOVERY_DEVICE_MODULES += android.hardware.boot@1.0 \
#                                  libkernelbootcp.trusty
TARGET_RECOVERY_DEVICE_MODULES := tzdata
#chargeled
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT)/usr/share/zoneinfo/tzdata
#TARGET_RECOVERY_DEVICE_MODULES += libxml2 libicuuc android.hidl.base@1.0 bootctrl.$(TARGET_BOARD_PLATFORM)
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so $(TARGET_OUT_SHARED_LIBRARIES)/libicuuc.so $(TARGET_OUT)/lib/android.hidl.base@1.0.so
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := false
TW_DEFAULT_LANGUAGE := ru
TW_EXCLUDE_APEX := true
TW_SCREEN_BLANK_ON_BOOT := false
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NO_LEGACY_PROPS := true
TW_USE_TOOLBOX := true
HAVE_SELINUX := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
# system won't be unmounted,
TW_NEVER_UNMOUNT_SYSTEM := true
TW_NO_SCREEN_BLANK := false
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
#TW_INCLUDE_FASTBOOTD := true
#TW_FORCE_USE_BUSYBOX := true
TW_NO_FASTBOOT_BOOT := true
TW_CUSTOM_POWER_BUTTON := 116
#TW_FORCE_CPUINFO_FOR_DEVICE_ID := true
#build sign ta file
PRODUCT_PACKAGES += \
    sf_trusty.elf
TW_LOAD_VENDOR_FIRMWARE := "sf_trusty.elf"
TW_NO_HAPTICS := true
TW_OVERRIDE_SYSTEM_PROPS := "ro.build.fingerprint"

# Libresetprop & resetprop
#TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true

# Exludes
# don't include default init.recovery.usb.rc, provide your own or use needed defines inside init.recovery.$DEVICE.rc
TW_EXCLUDE_DEFAULT_USB_INIT := true

# Fuse
TW_INCLUDE_NTFS_3G    := true
# exFAT FS Support
TW_INCLUDE_FUSE_EXFAT := true
# NTFS Support
#TW_INCLUDE_FUSE_NTFS := true

# select sdcard
TARGET_USE_SDCARDFS := false

#USE_VENDOR_LIB := true

# Storage
TW_NO_USB_STORAGE := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

# Debug
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
# ?
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
TARGET_RECOVERY_DEVICE_MODULES += strace
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace

# Show build time on the splash screen
TW_DEVICE_VERSION=$(shell date '+%Y%m%d') by vados-dev
