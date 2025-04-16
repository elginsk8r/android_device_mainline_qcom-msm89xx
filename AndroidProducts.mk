#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

BUILD_TARGETS := aosp lineage
BUILD_TYPES := user userdebug eng
BUILD_VARIANTS := car tv

SUPPORTED_DEVICES := \
    gt58 \
    mi8916 \
    mi8953_a \
    mi89x7 \
    tiare_mainline

ALL_DEVICE_NAMES := $(sort \
    $(SUPPORTED_DEVICES) \
    $(foreach device,$(SUPPORTED_DEVICES), \
        $(foreach variant,$(BUILD_VARIANTS), \
            $(if \
                $(foreach flavor,$(BUILD_TARGETS), \
                    $(wildcard \
                        $(LOCAL_DIR)/$(device)_$(variant)/$(flavor)_$(device)_$(variant).mk \
                    ) \
                ), \
                $(device)_$(variant) \
            ) \
        ) \
    ) \
)

$(foreach device,$(ALL_DEVICE_NAMES), \
    $(foreach flavor,$(BUILD_TARGETS), \
        $(if $(wildcard $(LOCAL_DIR)/$(device)/$(flavor)_$(device).mk), \
            $(eval PRODUCT_MAKEFILES += \
                $(flavor)_$(device):$(LOCAL_DIR)/$(device)/$(flavor)_$(device).mk) \
            $(foreach build_type,$(BUILD_TYPES), \
                $(eval COMMON_LUNCH_CHOICES += \
                    $(flavor)_$(device)-$(build_type)) \
            ) \
        ) \
    ) \
)

