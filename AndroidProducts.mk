#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    aosp_gt58:$(LOCAL_DIR)/aosp_gt58.mk \
    lineage_gt58:$(LOCAL_DIR)/lineage_gt58.mk

$(foreach build_type, user userdebug eng, \
    $(eval COMMON_LUNCH_CHOICES += aosp_gt58-$(build_type)) \
    $(eval COMMON_LUNCH_CHOICES += lineage_gt58-$(build_type)))
