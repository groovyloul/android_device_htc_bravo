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
    ro.ril.emc.mode=2 \
    wifi.interface=wlan0 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2

PRODUCT_PACKAGES += \
	gps.bravo \
	lights.bravo \
	sensors.bravo \

# Default network type.
# 0 => /* GSM/WCDMA (WCDMA preferred) */
# 3 => /* GSM/WCDMA (auto mode, according to PRL) */
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.default_network=3

# Set default_france.acdb to audio_ctl driver if the ro.cid is HTC__203
PRODUCT_PROPERTY_OVERRIDES += ro.ril.enable.prl.recognition=1

# Prebuilt files/configs
PRODUCT_COPY_FILES += \
    device/htc/bravo/prebuilt/init.bravo.rc:root/init.bravo.rc \
    device/htc/bravo/prebuilt/init.bravo.usb.rc:root/init.bravo.usb.rc \
    device/htc/bravo/prebuilt/ueventd.bravo.rc:root/ueventd.bravo.rc \
    device/htc/bravo/prebuilt/bravo-keypad.kl:system/usr/keylayout/bravo-keypad.kl \
    device/htc/bravo/prebuilt/bravo-keypad.kcm:system/usr/keychars/bravo-keypad.kcm \
    device/htc/bravo/prebuilt/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/bravo/prebuilt/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/bravo/prebuilt/curcial-oj.idc:system/usr/idc/curcial-oj.idc \
    device/htc/bravo/prebuilt/vold.fstab:system/etc/vold.fstab \
    device/htc/bravo/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# stuff common to all HTC phones
$(call inherit-product, vendor/qsd8k/qsd8k-vendor_gsm.mk)
$(call inherit-product, device/htc/common/common.mk)

# Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/bravo/bravo-vendor.mk)
