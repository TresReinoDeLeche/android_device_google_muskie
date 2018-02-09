# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit Carbon GSM telephony parts
$(call inherit-product, vendor/carbon/config/gsm.mk)

# Inherit Carbon product configuration
$(call inherit-product, vendor/carbon/config/common.mk)

-include device/google/wahoo/device-carbon.mk

# Inherit device product configuration
$(call inherit-product, device/google/muskie/device-walleye.mk)

PRODUCT_PACKAGES += \
    Dialer \
    Launcher3 \
    WallpaperPicker

PRODUCT_COPY_FILES += \
    device/google/muskie/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects_vendor.xml

## Device identifier. This must come after all inclusions
PRODUCT_RESTRICT_VENDOR_FILES := owner
PRODUCT_MANUFACTURER := Google
TARGET_MANUFACTURER := Google
PRODUCT_DEVICE := walleye
PRODUCT_NAME := carbon_walleye
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 2

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=walleye \
    BUILD_FINGERPRINT=google/walleye/walleye:8.1.0/OPM1.171019.019/4527419:user/release-keys \
    PRIVATE_BUILD_DESC="walleye-user 8.1.0 OPM1.171019.019 4527419 release-keys"

$(call inherit-product-if-exists, vendor/google/walleye/walleye-vendor.mk)
