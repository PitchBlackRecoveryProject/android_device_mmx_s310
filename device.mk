$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
# $(call inherit-product, device/common/gps/gps_us_supl.mk)

# Enable dex-preoptimization, but we have both limited space in the system and data partitions.
# PRODUCT_DEX_PREOPT_DEFAULT_FLAGS := --compiler-filter=interpret-only
# $(call add-product-dex-preopt-module-config,services,--compiler-filter=space)

$(call inherit-product-if-exists, vendor/mmx/s310/s310-vendor.mk)

LOCAL_PATH := device/mmx/s310

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_PACKAGES += \
    libxlog

# GSM
#PRODUCT_PACKAGES += \
#    gsm0710muxd
PRODUCT_PACKAGES += libmt6592


# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PROPERTY_OVERRIDES := \
	ro.mediatek.version.release=ALPS.W10.24.p0 \
	ro.mediatek.platform=MT6592 \
	ro.mediatek.chip_ver=S01 \
	ro.mediatek.version.branch=KK1.MP1 \
	ro.mediatek.version.sdk=2 \
	ro.telephony.sim.count=2 \
	ro.allow.mock.location=0 \
	ro.debuggable=1 \
	persist.sys.usb.config=mtp,adb \
	persist.service.adb.enable=1 \
	persist.service.debuggable=1 \
	persist.mtk.wcn.combo.chipid=-1

PRODUCT_NAME := full_s310
PRODUCT_DEVICE := s310

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
