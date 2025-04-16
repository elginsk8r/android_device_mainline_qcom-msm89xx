#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/qcom/msm89xx-common/mi8956

# Inherit from parent
$(call inherit-product, device/qcom/msm89xx-common/device.mk)

# AAPT
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# ConsumerIR
TARGET_HAS_IR := true

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Init
PRODUCT_PACKAGES += \
    fstab.mi8956 \
    fstab.mi8956.ramdisk \
    init.mi8956.rc \
    init.recovery.mi8956.rc \
    ueventd.mi8956.rc

PRODUCT_PACKAGES += \
    use_memfd.rc

$(call soong_config_set,mainline_common_libinit,set_properties_from,devicetree)

# Kernel
PRODUCT_PACKAGES += \
    modules.load.normal

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(TARGET_DEVICE_PATH)/overlays/overlay

# SoC
TARGET_QCOM_SOC := msm8956

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_DEVICE_PATH) \
    kernel/mainline/configs
