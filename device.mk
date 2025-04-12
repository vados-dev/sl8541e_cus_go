#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/sprd/sl8541e_cus_go

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml 

# Seccomp
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/configs/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

#PRODUCT_PACKAGES += \
#    libtrusty \
#    libteeproduction

#PRODUCT_PACKAGES += \
#    sprdstorageproxyd \
#    rpmbserver \

PRODUCT_PACKAGES += \
    zram.sh \
    ueventd.qcom.rc 

#exfat support
#PRODUCT_PACKAGES += \
#    mount.exfat \
#    mkfs.exfat \
#    fsck.exfat

# Inherit vendor
#$(call inherit-product, vendor/sprd/sl8541e_cus_go/device-vendor.mk)
                               
# A/B support
#PRODUCT_PACKAGES += \
#    update_engine \
#    update_verifier

#PRODUCT_PACKAGES += \
#     libkernelbootcp.trusty
#    bootctrl.sp9832e

#AB_OTA_POSTINSTALL_CONFIG += \
#    RUN_POSTINSTALL_system=true \
#    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
#    FILESYSTEM_TYPE_system=ext4 \
#    POSTINSTALL_OPTIONAL_system=true

# Enable update engine sideloading by including the static version of the
# boot_control HAL and its dependencies.
#PRODUCT_STATIC_BOOT_CONTROL_HAL := \
#    bootctrl.sp9832e \
#    libgptutils \
#    libz \
#    libcutils

# Boot control HAL
#PRODUCT_PACKAGES += \
#    android.hardware.boot@1.0-impl \
#    android.hardware.boot@1.0-service \
#    android.hardware.boot@1.0-impl.recovery

# Health
#PRODUCT_PACKAGES += \
#    android.hardware.health@1.0-impl \
#    android.hardware.health@1.0-service

# Keymaster HAL
#PRODUCT_PACKAGES += \
#    android.hardware.keymaster@4.0-unisoc.service \
#    libsoftkeymasterdevice 
#    android.hardware.keymaster@3.0-service \
#    android.hardware.keymaster@3.0-impl \
#    libkeymaster3
#    wait_for_keymaster
#    libpuresoftkeymasterdevice

#RECOVERY_LIBRARY_SOURCE_FILES += \
#    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster3.so \
#    $(TARGET_OUT_SHARED_LIBRARIES)/libsoftkeymasterdevice.so
#    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

#Add for android  gatekeeper HDIL
#DEVICE_MANIFEST_FILE += $(LOCAL_PATH)/manifest_gatekeeper.xml
#BOARD_HARDWARE_GATEKEEPER_CONFIG := true
#PRODUCT_COPY_FILES += frameworks/native/data/etc/android.software.secure_lock_screen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.secure_lock_screen.xml
#PRODUCT_PACKAGES += \
#    android.hardware.gatekeeper@1.0-service \
#    android.hardware.gatekeeper@1.0-impl

#PRODUCT_PACKAGES += \
#    gatekeeper.default

#PRODUCT_PACKAGES += \
#    gatekeeperd \
#    libgatekeeper

#PRODUCT_PACKAGES += \
#    tsupplicant

#PRODUCT_PACKAGES += \
#    keystore.sprdtrusty \
#    libkeystore

#PRODUCT_HOST_PACKAGES += sprd_sign \
#                         splitimg

#ifneq ($(BOARD_TEE_LOW_MEM),true)
#PRODUCT_PACKAGES += \
#    tsupplicant
#endif

#add for check keymaster & widevine keybox lib
#PRODUCT_PACKAGES += libcheckkeybox

#PRODUCT_COPY_FILES := \
#    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Support for the O-MR1 devices
#PRODUCT_COPY_FILES += \
#    build/make/target/product/vndk/init.gsi.rc:system/etc/init/init.gsi.rc \
#    build/make/target/product/vndk/init.vndk-27.rc:system/etc/init/gsi/init.vndk-27.rc

# Name space configuration file for non-enforcing VNDK
#PRODUCT_PACKAGES += \
#    ld.config.vndk_lite.txt

# TODO(b/78308559): includes vr_hwc into GSI before vr_hwc move to vendor
#PRODUCT_PACKAGES += \
#    vr_hwc

#    hwservicemanager \
#    servicemanager \
#    libhwbinder \
#    libdiskconfig \
#    libteeproduction

#    gatekeeperd \

# Fastbootd and fastboot HAL
#PRODUCT_PACKAGES += \
#    fastbootd \
#    android.hardware.fastboot@1.0-impl

#include vendor/sprd/proprietories-source/charge/charge.mk
#poweroff charge
#PRODUCT_PACKAGES += charge \
#                    phasecheckserver

#PowerHint HAL
# sprdemand, interactive
#BOARD_POWERHINT_HAL := interactive
#POWERHINT_PRODUCT_CONFIG := sharkle

# Power hint config file
#PRODUCT_PACKAGES += \
#    power_scene_id_define.txt \
#    power_scene_config.xml \
#    power_resource_file_info.xml \
#    libpowerhal_cli \
#    libpowerhal_cli.vendor

# ION HAL module
#PRODUCT_PACKAGES += \
#    libmemion
# ION module

#PRODUCT_PACKAGES += \
#    libion

#MAP USER
#PRODUCT_PACKAGES += \
#    libmapuser

# Enable virtual A/B OTA
#$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Overlays
#PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
#PRODUCT_USE_DYNAMIC_PARTITIONS := true

#TARGET_RECOVERY_DEVICE_MODULES += \
#    vold \
#    vdc \
#    Devmapper \
#    storageproxyd \
#    cryptfs \
#    fs_mgr \
#    wait_for_keymaster
#    gatekeeperd \
#    keymaster \
#    make_ext4fs \
#    trusty
#    libsoftkeymasterdevice \
    
#RECOVERY_BINARY_SOURCE_FILES += \
#    $(TARGET_OUT_EXECUTABLES)/keystore \
#    $(TARGET_OUT_EXECUTABLES)/gatekeeperd \
#    $(TARGET_OUT_EXECUTABLES)/rpmbserver \
#    $(TARGET_OUT_EXECUTABLES)/vold \
#    $(TARGET_OUT_EXECUTABLES)/vdc \
#    $(TARGET_OUT_EXECUTABLES)/storageproxyd \
#    $(TARGET_OUT_EXECUTABLES)/wait_for_keymaster

# Fastbootd and fastboot HAL
#PRODUCT_PACKAGES += \
#    fastbootd \
#    android.hardware.fastboot@1.0-impl \
#    android.hardware.fastboot@1.0-impl-mock \
#    android.hardware.fastboot@1.0-impl-mock.recovery

#PRODUCT_PACKAGES += \
#    libtrusty \
#    libf2fs_sparseblock \
#    libdiskconfig \
#    libteeproduction

#PRODUCT_PACKAGES += \
#    storageproxyd \
#    rpmbserver
#    vold \
#    vdc
