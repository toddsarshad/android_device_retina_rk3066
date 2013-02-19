$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

#LOCAL_PATH := device/chuwi_v99/rk30sdk
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/rk30xxnand_ko.ko:root/rk30xxnand_ko.ko \
    $(LOCAL_PATH)/ramdisk/init:root/init \
    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
    $(LOCAL_PATH)/ramdisk/init.rk30board.rc:root/init.rk30board.rc \
    $(LOCAL_PATH)/ramdisk/init.rk30board.usb.rc:root/init.rk30board.usb.rc \
    $(LOCAL_PATH)/ramdisk/misc.img:root/misc.img \
    $(LOCAL_PATH)/ramdisk/ueventd.rk30board.rc:root/ueventd.rk30board.rc

# init.d scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.d/03kernel:system/etc/init.d/03kernel \
    $(LOCAL_PATH)/init.d/04mount:system/etc/init.d/04mount

# Prebuilt configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/call-pppd:system/etc/ppp/call-pppd \
    $(LOCAL_PATH)/configs/ip-down:system/etc/ppp/ip-down \
    $(LOCAL_PATH)/configs/ip-up:system/etc/ppp/ip-up \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/rk29-keypad.kl:/system/usr/keylayout/rk29-keypad.kl

# Prebuilt kernel modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modules/mali.ko:system/lib/modules/mali.ko \
    $(LOCAL_PATH)/modules/rk29-ipp.ko:system/lib/modules/rk29-ipp.ko \
    $(LOCAL_PATH)/modules/rkwifi.ko:system/lib/modules/rkwifi.ko \
    $(LOCAL_PATH)/modules/ump.ko:system/lib/modules/ump.ko \
    $(LOCAL_PATH)/modules/vpu_service.ko:system/lib/modules/vpu_service.ko \
    $(LOCAL_PATH)/modules/wlan.ko:system/lib/modules/wlan.ko

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
    
PRODUCT_PACKAGES := \
    HoloSpiralWallpaper \
    LiveWallpapersPicker \
    VisualizationWallpapers \

PRODUCT_PACKAGES += \
    Camera

PRODUCT_PACKAGES += \
    audio.primary.default \
    audio_policy.default \
    audio.a2dp.default

PRODUCT_PACKAGES += \
    librs_jni \
    liba2dp \
    com.android.future.usb.accessory
    
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

PRODUCT_PROPERTY_OVERRIDES := \
    service.adb.root=1 \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Europe/Rome \
    persist.sys.language=en \
    persist.sys.country=US \
    persist.sys.use_dithering=1 \
    persist.sys.purgeable_assets=0 \
    windowsmgr.max_events_per_sec=240 \
    view.touch_slop=2 \
    view.minimum_fling_velocity=25 \
    ro.additionalmounts=/mnt/external_sd \
    ro.vold.switchablepair=/mnt/sdcard,/mnt/external_sd \
    persist.sys.vold.switchexternal=0

PRODUCT_AAPT_CONFIG := large xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_TAGS += dalvik.gc.type-precise

TARGET_BOOTANIMATION_NAME := horizontal-2048x1536

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0


$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product, build/target/product/full_base.mk)
#$(call inherit-product, build/target/product/full.mk)
$(call inherit-product-if-exists, vendor/chuwi_v99/rk30sdk/rk30sdk-vendor.mk)