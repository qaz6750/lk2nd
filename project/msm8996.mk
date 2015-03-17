# top level project rules for the msm8996 project
#
LOCAL_DIR := $(GET_LOCAL_DIR)

TARGET := msm8996

MODULES += app/aboot

ifeq ($(TARGET_BUILD_VARIANT),user)
DEBUG := 0
else
DEBUG := 1
endif

EMMC_BOOT := 1
ENABLE_SDHCI_SUPPORT := 1
ENABLE_UFS_SUPPORT   := 1
ENABLE_BOOT_CONFIG_SUPPORT := 1
ENABLE_USB30_SUPPORT := 1
ENABLE_QGIC3 := 1
ENABLE_PARTIAL_GOODS_SUPPORT := 1
ENABLE_RPMB_SUPPORT := 1
ENABLE_GLINK_SUPPORT := 1

DEFINES +=VIRTIO=1

#DEFINES += WITH_DEBUG_DCC=1
DEFINES += WITH_DEBUG_UART=1
#DEFINES += WITH_DEBUG_FBCON=1
DEFINES += DEVICE_TREE=1
DEFINES += SPMI_CORE_V2=1
DEFINES += BAM_V170=1

DEFINES += ABOOT_IGNORE_BOOT_HEADER_ADDRS=1

DEFINES += ABOOT_FORCE_KERNEL_ADDR=0x80008000
DEFINES += ABOOT_FORCE_RAMDISK_ADDR=0x82200000
DEFINES += ABOOT_FORCE_TAGS_ADDR=0x82000000
DEFINES += ABOOT_FORCE_KERNEL64_ADDR=0x80080000
DEFINES += USB_RESET_FROM_CLK=1
DEFINES += USE_BOOTDEV_CMDLINE=1
DEFINES += USE_RPMB_FOR_DEVINFO=1

#Disable thumb mode
ENABLE_THUMB := false

ifeq ($(ENABLE_GLINK_SUPPORT),1)
DEFINES += GLINK_SUPPORT=1
endif

ifeq ($(EMMC_BOOT),1)
DEFINES += _EMMC_BOOT=1
endif

ifeq ($(ENABLE_SDHCI_SUPPORT),1)
DEFINES += MMC_SDHCI_SUPPORT=1
endif

ifeq ($(ENABLE_UFS_SUPPORT),1)
DEFINES += UFS_SUPPORT=1
endif

ifeq ($(ENABLE_USB30_SUPPORT),1)
DEFINES += USB30_SUPPORT=1
endif

ifeq ($(ENABLE_PARTIAL_GOODS_SUPPORT),1)
DEFINES += ENABLE_PARTIAL_GOODS_SUPPORT=1
endif

CFLAGS += -Werror

#SCM call before entering DLOAD mode
DEFINES += PLATFORM_USE_SCM_DLOAD=1
