#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This is the product configuration for a generic GSM bravo,
# not specialized for any geography.
#

# First, the most specific values, i.e. the aspects that are specific to GSM

DEVICE_PACKAGE_OVERLAYS := device/htc/bravo/overlay
PRODUCT_LOCALES := en

# General propreties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.ecc.HTC-ELL=92,93,94 \
    ro.ril.ecc.HTC-WWE=999 \
    ro.ril.enable.a52.HTC-ITA=1 \
    ro.ril.enable.a53.HTC-ITA=1 \
    ro.ril.enable.a52=0 \
    ro.ril.enable.a53=1 \
    ro.ril.enable.dtm=1 \
    ro.ril.gprsclass=12 \
    ro.ril.hsdpa.category=8 \
    ro.ril.hsupa.category=5 \
    ro.ril.hsxpa=2 \
    ro.ril.def.agps.mode=2 \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2
    wifi.interface=wlan0 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2

# Default network type.
# 0 => /* GSM/WCDMA (WCDMA preferred) */
# 3 => /* GSM/WCDMA (auto mode, according to PRL) */
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.default_network=3

# Set default_france.acdb to audio_ctl driver if the ro.cid is HTC__203
PRODUCT_PROPERTY_OVERRIDES += ro.ril.enable.prl.recognition=1

#
# Packages required for bravo
#
# Sensors
PRODUCT_PACKAGES += \
    gps.bravo \
    lights.bravo \
    sensors.bravo

# Bravo uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Prebuilt files/configs
PRODUCT_COPY_FILES += \
    device/htc/bravo/init.bravo.rc:root/init.bravo.rc \
    device/htc/bravo/init.bravo.usb.rc:root/init.bravo.usb.rc \
    device/htc/bravo/ueventd.bravo.rc:root/ueventd.bravo.rc \
    device/htc/bravo/bravo-keypad.kl:system/usr/keylayout/bravo-keypad.kl \
    device/htc/bravo/bravo-keypad.kcm:system/usr/keychars/bravo-keypad.kcm \
    device/htc/bravo/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/bravo/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/bravo/curcial-oj.idc:system/usr/idc/curcial-oj.idc \
    device/htc/bravo/vold.fstab:system/etc/vold.fstab \
    device/htc/bravo/media_profiles.xml:system/etc/media_profiles.xml

# Prebuilt kernel & modules
PRODUCT_COPY_FILES += \
    device/htc/bravo/prebuilt/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/bravo/prebuilt/kernel:kernel

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml 

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)
$(call inherit-product-if-exists, vendor/qsd8k/qsd8k.mk)

# Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/bravo/bravo-vendor.mk)
