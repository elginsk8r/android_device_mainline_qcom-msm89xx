#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/qcom/msm89xx-common/mi8916

# Inherit from parent
$(call inherit-product, device/qcom/msm89xx-common/device.mk)

# AAPT
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Audio
TARGET_AUDIO_MAINLINE_UCM_PROFILES := wt88047

# Boot animation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Init
PRODUCT_PACKAGES += \
    fstab.mi8916 \
    fstab.mi8916.ramdisk \
    init.mi8916.rc \
    init.recovery.mi8916.rc \
    ueventd.mi8916.rc

PRODUCT_PACKAGES += \
    use_memfd.rc

$(call soong_config_set,mainline_common_libinit,set_properties_from,devicetree)

# Input
PRODUCT_PACKAGES += \
    ts_vkeys.kl

TARGET_TOUCHSCREEN_HAS_VIRTUAL_KEYS := true

# Kernel
PRODUCT_PACKAGES += \
    modules.load.normal

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(TARGET_DEVICE_PATH)/overlays/overlay

# Partitions
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

# SoC
TARGET_QCOM_SOC_FAMILY := msm8916

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_DEVICE_PATH) \
    kernel/mainline/configs
