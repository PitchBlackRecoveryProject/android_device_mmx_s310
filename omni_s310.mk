# Release name
PRODUCT_RELEASE_NAME := s310

LOCAL_PATH := device/mmx/s310

# Inherit some common omni stuff.
$(call inherit-product, vendor/pb/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/mmx/s310/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := s310
PRODUCT_NAME := omni_s310
PRODUCT_BRAND := mmx
PRODUCT_MODEL := s310
PRODUCT_MANUFACTURER := mmx

##PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=6.0/MRA58M/2280749:user/release-keys PRIVATE_BUILD_DESC="mt6582-user 6.0 MRA58M 2280749 release-keys"
