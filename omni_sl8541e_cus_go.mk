#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Release name
PRODUCT_RELEASE_NAME := FX Eplutus D41

# Inherit from those products. Most specific first.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
#$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/languages_full.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit vendor
#$(call inherit-product, vendor/sprd/sl8541e_cus_go/device-vendor.mk)

# Inherit some common Omni stuff.
#$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, vendor/pb/config/common.mk)

# Inherit from sl8541e_cus_go device
$(call inherit-product, device/sprd/sl8541e_cus_go/device.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
#$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

#Treble Support
$(call inherit-product, $(SRC_TARGET_DIR)/product/treble_common.mk)
# Split selinux policy
PRODUCT_FULL_TREBLE_OVERRIDE := true

#Unified TWRP Tree for a11
#$(call inherit-product, device/android/common/device.mk)

#ENABLE_VIRTUAL_AB := true

PRODUCT_PACKAGES += \
	charger \
	charger_res_images

PRODUCT_DEVICE := sl8541e_cus_go
PRODUCT_NAME := omni_sl8541e_cus_go
PRODUCT_BRAND := sprd
PRODUCT_MODEL := D41
PRODUCT_MANUFACTURER := sprd

PRODUCT_GMS_CLIENTID_BASE := android-sprd

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.product.device \
    ro.product.name \
    ro.build.product
#
#    net.bt.name

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=1 \
    ro.adb.secure=0 \
    ro.allow.mock.location=0 \
    ro.frp.pst=/dev/block/platform/soc/soc:ap-ahb/20600000.sdio/by-name/persist \
    ro.vendor.product.partitionpath=/dev/block/platform/soc/soc:ap-ahb/20600000.sdio/by-name/ \
    ro.vendor.keybox.id.value=SPRD \
    sys.usb.controller=musb-hdrc.0.auto \
    persist.sys.usb.config=adb,vser,gser \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    ro.treble.enabled=true

PRODUCT_VENDOR_BUILD_PROP_OVERRIDES += \
    ro.vendor.vndk.version=1 \
    ro.build.selinux=0 \
    ro.zygote=zygote32 \
    sys.usb.controller=musb-hdrc.0.auto \
    ro.support.auto.roam=disabled \
    ro.hwui.use_offline_shader=1

#PRODUCT_BUILD_PROP_OVERRIDES += \
#    ro.build.version.security_patch=2018-09-05
PRODUCT_PLATFORM := sp9832e
PRODUCT_CHARACTERISTICS := default

# use PRODUCT_SHIPPING_API_LEVEL indicates the first api level,and contorl treble macro
#PRODUCT_SHIPPING_API_LEVEL := 26
#PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

PRODUCT_PROPERTY_OVERRIDES += \
        ro.storage.flash_type=2 \
        sys.internal.emulated=1 \
        persist.storage.type=2 \
        ro.storage.install2internal=0 \
        ro.hardware.keystore=sprdtrusty

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sp9832e_1h10_native-user 8.1.0 OPM2.171019.012 52215 release-keys" \
    PRODUCT_NAME=sl8541e_cus_go \
    BUILD_PRODUCT=sl8541e_cus_go \
    TARGET_DEVICE=sl8541e_cus_go

BUILD_FINGERPRINT := SPRD/sp9832e_1h10_native/sp9832e_1h10:8.1.0/OPM2.171019.012/52215:user/release-keys
PLATFORM_SECURITY_PATCH := 2018-09-05

TARGET_VENDOR_PRODUCT_NAME := sl8541e_cus_gofu_osea
TARGET_VENDOR_DEVICE_NAME := sl8541e_cus_go
