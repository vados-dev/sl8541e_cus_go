#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

#ifeq ($(TARGET_DEVICE),sl8541e_cus_go)
#include $(call all-subdir-makefiles,$(LOCAL_PATH))
ifneq ($(filter sl8541e_cus_go,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
