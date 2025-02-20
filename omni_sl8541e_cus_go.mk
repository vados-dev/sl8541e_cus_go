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
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
#$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from sl8541e_cus_go device
$(call inherit-product, device/sprd/sl8541e_cus_go/device.mk)

# Inherit some common Omni stuff.
#$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, vendor/pb/config/common.mk)

#Treble Support
#$(call inherit-product, $(SRC_TARGET_DIR)/product/treble_common.mk)

PRODUCT_DEVICE := sl8541e_cus_go
PRODUCT_NAME := omni_sl8541e_cus_go
PRODUCT_BRAND := sprd
PRODUCT_MODEL := D41
PRODUCT_MANUFACTURER := sprd

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.product.device \
    ro.product.name \
    ro.build.product

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    ro.adb.secure=0 \
    ro.treble.enabled=true \
    ro.vendor.build.security_patch=2099-12-31

PRODUCT_GMS_CLIENTID_BASE := android-sprd

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2018-09-05

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sp9832e_1h10_native-user 8.1.0 OPM2.171019.012 52215 release-keys"

BUILD_FINGERPRINT := SPRD/sp9832e_1h10_native/sp9832e_1h10:8.1.0/OPM2.171019.012/52215:user/release-keys
