include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))

# Disable any and all target finalize hooks
TARGET_FINALIZE_HOOKS =

BR2_ROOTFS_POST_SCRIPT_ARGS = $(call qstrip,$(RXOS_OVERLAY_NAME))
