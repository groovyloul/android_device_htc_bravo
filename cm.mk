# Inherit AOSP device configuration for bravo.
$(call inherit-product, device/htc/bravo/full_bravo.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Include GSM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_bravo
PRODUCT_BRAND := google
PRODUCT_DEVICE := bravo
PRODUCT_MODEL := Desire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=bravo BUILD_ID=IML74K \
BUILD_FINGERPRINT=google/bravo/bravo:4.0.3/IML74K/189904:user/release-keys \
PRIVATE_BUILD_DESC="bravo-user 4.0.3 IML74K 189904 release-keys"

#
# Set up the product codename, build version & MOTD.
#
PRODUCT_CODENAME := bravo
#PRODUCT_VERSION_DEVICE_SPECIFIC := v1
ifeq ($(NIGHTLY_BUILD),true)
    BUILD_VERSION := RC2.1U0-$(shell date +%m%d%Y)-NIGHTLY
else
    BUILD_VERSION := RC2.1U0
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.romversion=BCM-$(BUILD_VERSION)
#
# Extra Packages
#
PRODUCT_PACKAGES += \
    Stk \
    Camera

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

# Release name and versioning
PRODUCT_RELEASE_NAME := Desire
PRODUCT_VERSION_DEVICE_SPECIFIC := -DK_Zero-Cool-$(shell date +%m%d%Y)

# Bootanimation
PRODUCT_COPY_FILES += device/htc/bravo/extras/bootanimation.zip:system/media/bootanimation.zip
PRODUCT_COPY_FILES += device/htc/bravo/extras/sysctl.conf:system/etc/sysctl.conf

# Get some Gapps
$(call inherit-product-if-exists, gapps/gapps.mk)
