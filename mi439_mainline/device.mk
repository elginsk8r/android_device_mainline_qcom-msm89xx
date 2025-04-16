#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/qcom/msm89xx-common/mi439_mainline

# Inherit from parent
$(call inherit-product, device/qcom/msm89xx-common/device.mk)

# AAPT
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1440
TARGET_SCREEN_WIDTH := 720

# ConsumerIR
TARGET_HAS_IR := true

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Display
TARGET_USES_FRAMEBUFFER_DISPLAY := true # temporary

# Health
TARGET_HEALTH_HAL := cuttlefish # temporary

# Init
PRODUCT_PACKAGES += \
    fstab.mi439 \
    fstab.mi439.ramdisk \
    init.mi439.rc \
    init.recovery.mi439.rc \
    ueventd.mi439.rc

PRODUCT_PACKAGES += \
    use_memfd.rc

$(call soong_config_set,mainline_common_libinit,set_properties_from,devicetree)

# Kernel
PRODUCT_PACKAGES += \
    modules.load.normal

# SoC
TARGET_QCOM_SOC := sdm439

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_DEVICE_PATH) \
    kernel/mainline/configs
