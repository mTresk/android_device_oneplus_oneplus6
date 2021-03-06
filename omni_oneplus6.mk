# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

VENDOR_EXCEPTION_PATHS := oneplus \
    omni \
    gapps \
    pixelstyle \
    google-customization

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080p
AB_OTA_UPDATER := true

DEVICE_PACKAGE_OVERLAYS += device/oneplus/oneplus6/overlay/device
DEVICE_PACKAGE_OVERLAYS += device/oneplus/oneplus6/overlay/common
DEVICE_PACKAGE_OVERLAYS += vendor/omni/overlay/CarrierConfig

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# get the rest of aosp stuff after ours
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline_system_arm64.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oneplus/oneplus6/device.mk)

ALLOW_MISSING_DEPENDENCIES := true
PRODUCT_SHIPPING_API_LEVEL := 27

PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

# Discard inherited values and use our own instead.
PRODUCT_NAME := omni_oneplus6
PRODUCT_DEVICE := oneplus6
PRODUCT_BRAND := OnePlus
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_MODEL := ONEPLUS A6003

TARGET_DEVICE := OnePlus6
PRODUCT_SYSTEM_NAME := OnePlus6

VENDOR_RELEASE := 10/QKQ1.190716.003/2004142132:user/release-keys
BUILD_FINGERPRINT := OnePlus/OnePlus6/OnePlus6:$(VENDOR_RELEASE)
OMNI_BUILD_FINGERPRINT := OnePlus/OnePlus6/OnePlus6:$(VENDOR_RELEASE)
OMNI_PRIVATE_BUILD_DESC := "'OnePlus6-user 10 QKQ1.190716.003 2004142132 release-keys'"

PLATFORM_SECURITY_PATCH_OVERRIDE := 2020-04-01

TARGET_VENDOR := oneplus

#PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.product.model

$(call inherit-product, vendor/oneplus/oneplus6/oneplus6-vendor.mk)

