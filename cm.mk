# Inherit AOSP device configuration for bravo.
$(call inherit-product, device/htc/bravo/full_bravo.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Include GSM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

# Include BCM stuff
$(call inherit-product-if-exists, vendor/bcm/bcm-vendor.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_bravo
PRODUCT_BRAND := google
PRODUCT_DEVICE := bravo
PRODUCT_CODENAME := bravo
PRODUCT_MODEL := HTC Desire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=bravo BUILD_ID=IML74K \
BUILD_FINGERPRINT=google/bravo/bravo:4.0.3/IML74K/189904:user/release-keys \
PRIVATE_BUILD_DESC="bravo-user 4.0.3 IML74K 189904 release-keys"
