include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))

# Disable any and all target finalize hooks
TARGET_FINALIZE_HOOKS =

ifndef RXOS_OVERLAY_VERSION
VERSION_STRING = $(shell date '+%Y%m%d')
else
VERSION_STRING = $(call qstrip,$(RXOS_OVERLAY_VERSION))
endif

BR2_ROOTFS_POST_SCRIPT_ARGS = $(call qstrip,$(RXOS_OVERLAY_NAME)) \
							  $(VERSION_STRING)
