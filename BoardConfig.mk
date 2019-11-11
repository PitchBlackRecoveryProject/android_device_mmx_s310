# inherit from the proprietary version
-include vendor/mmx/s310/BoardConfigVendor.mk

LOCAL_PATH := device/mmx/s310

# Board
TARGET_BOARD_PLATFORM := mt6592
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
ARCH_ARM_HAVE_VFP := true
TARGET_CPU_SMP := true
TARGET_ARCH := arm
ARCH_ARM_HAVE_NEON := true
TARGET_NO_BOOTLOADER := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a7
TARGET_CPU_VARIANT:= cortex-a7
TARGET_CPU_MEMCPY_OPT_DISABLE := true

BOARD_HAS_NO_SELECT_BUTTON := true

# Enable dex-preoptimization
WITH_DEXPREOPT := false
DONT_DEXPREOPT_PREBUILTS := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6582

TARGET_USERIMAGES_USE_EXT4:=true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Assert
TARGET_OTA_ASSERT_DEVICE := s310
# Partitions & Image
BOARD_BOOTIMAGE_PARTITION_SIZE := 13485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 13485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1468006400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5452595200
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_CACHEIMAGE_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

# Flags
TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Kernel 
BOARD_KERNEL_CMDLINE :=
# BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
#TARGET_KERNEL_CONFIG := 2014011_debug_defconfig
#TARGET_KERNEL_SOURCE := kernel/mmx/s310
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/MTKbootimg.mk
BOARD_CUSTOM_BOOTIMG := true

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/twrp.fstab

TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun%d/file"

# TWRP stuff
DEVICE_RESOLUTION := 720x1280
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INCLUDE_JB_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p8"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,discard,noauto_da_alloc,data=ordered"
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_BUILD_ZH_CN_SUPPORT := true
TW_DEFAULT_LANGUAGE := zh_CN
TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/recovery/root/init.rc
#TARGET_PREBUILT_RECOVERY_KERNEL := $(LOCAL_PATH)/recovery_kernel

# Sepolicy hack for old kernel, our mt6582 & mt6592 version is 26.
POLICYVERS := 26

# Hack for build
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
