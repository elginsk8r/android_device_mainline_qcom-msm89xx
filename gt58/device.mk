#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/mainline/qcom-msm89xx/gt58

# Inherit options from mainline/qcom-common
TARGET_QCOM_SOC_FAMILY := msm8916
## TODO: Bringup the corresponding hardware and remove the following definitions
TARGET_SUPPORTS_SUSPEND := false
include device/mainline/qcom-common/optional/options.mk

# Inherit from parent
$(call inherit-product, device/mainline/qcom-msm89xx/device.mk)

# AAPT
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Audio
PRODUCT_PACKAGES += \
    audio.gt58.xml \
    audio.tfa989x.xml

# Boot animation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_SCREEN_HEIGHT := 1024
TARGET_SCREEN_WIDTH := 768

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Fastboot
TARGET_BOARD_FASTBOOT_INFO_FILE := $(TARGET_DEVICE_PATH)/fastboot-info.txt

# Init
PRODUCT_PACKAGES += \
    fstab.gt58 \
    fstab.gt58.ramdisk \
    init.gt58.rc \
    init.recovery.gt58.rc \
    ueventd.gt58.rc

PRODUCT_PACKAGES += \
    use_memfd.rc

$(call soong_config_set,mainline_common_libinit,set_properties_from,devicetree)

# Kernel
PRODUCT_PACKAGES += \
    modules.load.normal

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(TARGET_DEVICE_PATH)/overlays/overlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_DEVICE_PATH) \
    kernel/mainline/configs
