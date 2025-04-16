#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from parent
include device/mainline/qcom-msm89xx/BoardConfig.mk

# A/B
AB_OTA_UPDATER := false

# Bootloader
BOARD_PREBUILT_BOOTLOADER=$(INSTALLED_LK2NDIMAGE_TARGET)
TARGET_NO_BOOTLOADER := false

# Boot parameters
BOARD_KERNEL_CMDLINE += \
    androidboot.hardware=gt58

# Kernel
TARGET_KERNEL_SOURCE := kernel/mainline/msm8916-mainline

TARGET_DTB_LIST_WILDCARD := \
    qcom/msm8916-samsung-gt58

TARGET_KERNEL_CONFIG := \
    msm8916_defconfig

TARGET_KERNEL_CONFIG_EXT := \
    kernel/mainline/configs/fragments/android-base-pre/common.config \
    kernel/mainline/configs/fragments/android-base-pre/arm64.config \
    kernel/configs/b/android-6.12/android-base.config \
    kernel/mainline/configs/fragments/android-base-conditional/CONFIG_ARM64-y.config \
    kernel/mainline/configs/fragments/common.config \
    kernel/mainline/configs/fragments/y/fbcon.config \
    kernel/mainline/configs/fragments/n/disable-clang-hardening-features.config \
    kernel/mainline/configs/fragments/n/faster-build-time.config \
    $(TARGET_DEVICE_PATH)/kconfigs/fixups.config

# Kernel modules
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.basic)) \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.drm)) \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.touchscreen))
BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)
RECOVERY_KERNEL_MODULES := \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.include_dep.basic)) \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.include_dep.drm)) \
    $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)

# OTA
TARGET_OTA_ASSERT_DEVICE := gt58

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 62914560
BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_GT58_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor
BOARD_GT58_DYNAMIC_PARTITIONS_SIZE := 3141533696
BOARD_SUPER_PARTITION_GROUPS := gt58_dynamic_partitions
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_SIZE := 3145728000
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_METADATA_PARTITION := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Properties
TARGET_VENDOR_PROP += $(TARGET_DEVICE_PATH)/properties/vendor.prop

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_DENSITY := mdpi
TARGET_RECOVERY_FSTAB := $(TARGET_DEVICE_PATH)/fstab/fstab.gt58
