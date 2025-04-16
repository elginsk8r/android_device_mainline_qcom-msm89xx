#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    aosp_mi8916:$(LOCAL_DIR)/aosp_mi8916.mk \
    lineage_mi8916:$(LOCAL_DIR)/lineage_mi8916.mk

$(foreach build_type, user userdebug eng, \
    $(eval COMMON_LUNCH_CHOICES += aosp_mi8916-$(build_type)) \
    $(eval COMMON_LUNCH_CHOICES += lineage_mi8916-$(build_type)))
