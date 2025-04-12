#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

export ANDROID_SET_JAVA_HOME=true
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export LC_ALL=C
export ALLOW_MISSING_DEPENDENCIES=true
export TARGET_COMPILE_WITH_MSM_KERNEL=false
export CROSS_COMPILE=prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin/arm-eabi-
add_lunch_combo omni_sl8541e_cus_go-eng
