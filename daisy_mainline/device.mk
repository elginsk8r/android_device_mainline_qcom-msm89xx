#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/qcom/msm89xx-common/daisy_mainline

# Inherit from parent
$(call inherit-product, device/qcom/msm89xx-common/device.mk)

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    FILESYSTEM_TYPE_system=ext4

AB_OTA_UPDATER := true

# AAPT
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
TARGET_AUDIO_MAINLINE_UCM_PROFILES := xiaomi-daisy

# Bluetooth
PRODUCT_VENDOR_PROPERTIES += bluetooth.le.disable_apcf_extended_features=0

# Boot animation
TARGET_SCREEN_HEIGHT := 2280
TARGET_SCREEN_WIDTH := 1080

# ConsumerIR
TARGET_HAS_IR := true

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Firmware
PRODUCT_COPY_FILES += \
    vendor/xiaomi/msm8953-common/proprietary/vendor/firmware/a506_zap.b00:$(TARGET_COPY_OUT_ODM)/firmware/qcom/msm8953/xiaomi/daisy/a506_zap.b00 \
    vendor/xiaomi/msm8953-common/proprietary/vendor/firmware/a506_zap.b01:$(TARGET_COPY_OUT_ODM)/firmware/qcom/msm8953/xiaomi/daisy/a506_zap.b01 \
    vendor/xiaomi/msm8953-common/proprietary/vendor/firmware/a506_zap.b02:$(TARGET_COPY_OUT_ODM)/firmware/qcom/msm8953/xiaomi/daisy/a506_zap.b02 \
    vendor/xiaomi/msm8953-common/proprietary/vendor/firmware/a506_zap.mdt:$(TARGET_COPY_OUT_ODM)/firmware/qcom/msm8953/xiaomi/daisy/a506_zap.mdt

# Init
PRODUCT_PACKAGES += \
    fstab.daisy \
    fstab.daisy.ramdisk \
    init.daisy.rc \
    init.mi8953_a.rc \
    ueventd.daisy.rc \
    ueventd.mi8953_a.rc

PRODUCT_PACKAGES += \
    use_memfd.rc

$(call soong_config_set,mainline_common_libinit,set_properties_from,devicetree)

# Kernel
PRODUCT_PACKAGES += \
    modules.load.normal

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(TARGET_DEVICE_PATH)/../mi8953_a/overlays/overlay

# Properties
PRODUCT_VENDOR_PROPERTIES += \
    vendor.remoteproc.4080000_remoteproc.ignore=1

# SoC
TARGET_QCOM_SOC := msm8953

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_DEVICE_PATH) \
    device/qcom/msm89xx-common/mi8953_a \
    kernel/mainline/configs
