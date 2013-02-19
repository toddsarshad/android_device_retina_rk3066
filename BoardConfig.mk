# overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# cflags
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# inherit from the proprietary version
-include vendor/chuwi_v99/rk30sdk/BoardConfigVendor.mk

# chipset & platform
PRODUCT_CHARACTERISTICS := tablet
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_VFP := true
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_ARMV7A := true
TARGET_BOARD_PLATFORM := rk30sdk
TARGET_BOOTLOADER_BOARD_NAME := rk30board

# kernel
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x60400000
BOARD_KERNEL_PAGESIZE := 16384
TARGET_PREBUILT_KERNEL := device/chuwi_v99/rk30sdk/kernel

# partitioning
TARGET_NO_BOOTLOADER := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 16384
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true

# graphics
BOARD_EGL_CFG := device/chuwi_v99/rk30sdk/egl.cfg
USE_OPENGL_RENDERER := true
ENABLE_WEBGL := true
DEVICE_RESOLUTION := 2048x1536
BOARD_USE_SKIA_LCDTEXT := true

# audio
BOARD_USES_GENERIC_AUDIO := true
#BOARD_USES_AUDIO_LEGACY := true

# camera
USE_CAMERA_STUB := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
TARGET_USES_ION := true

# radio
BOARD_USES_HC_RADIO := true
TARGET_NO_RADIOIMAGE := true
BOARD_USES_LEGACY_RIL := true

# wlan
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_RK903.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_RK903_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/fw_RK903_p2p.bin"
WIFI_DRIVER_MODULE_NAME     := "wlan"
WIFI_DRIVER_MODULE_ARG      := ""

# bluetooth
BOARD_HAVE_BLUETOOTH := true

# other
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/chuwi_v99/rk30sdk/releasetools/rk30sdk_ota_from_target_files

# recovery
TARGET_PROVIDES_INIT_RC := true
TARGET_RECOVERY_INITRC := device/chuwi_v99/rk30sdk/recovery.init.rc
TARGET_RECOVERY_PRE_COMMAND := "busybox dd if=/misc.img of=/dev/block/mtdblock0; sync"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb20_otg/gadget/lun0/file"
#BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
BOARD_UMS_2ND_LUNFILE := "/sys/devices/platform/usb20_otg/gadget/lun1/file"
#BOARD_UMS_2ND_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun1/file"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_NO_RGBX_8888 := true

# TWRP
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"