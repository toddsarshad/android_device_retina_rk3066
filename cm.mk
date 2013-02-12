## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := rk30sdk

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/chuwi_v99/rk30sdk/device_rk30sdk.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rk30sdk
PRODUCT_NAME := cm_rk30sdk
PRODUCT_BRAND := chuwi_v99
PRODUCT_MODEL := rk30sdk
PRODUCT_MANUFACTURER := chuwi_v99
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nakasi PRODUCT_BRAND=Google BUILD_DISPLAY_ID=JRN84D BUILD_FINGERPRINT=google/nakasi/grouper:4.1/JRN84D/392829:user/release-keys PRIVATE_BUILD_DESC="nakasi-user 4.1 JRN84D 392829 release-key"
