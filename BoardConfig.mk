#
# Copyright (C) 2015 The Android Open-Source Project
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

LOCAL_PATH := device/samsung/chagall-klimt-common

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos5
#TARGET_SLSI_VARIANT := 
#The gralloc module from insignal is not compatible with camera in mm
TARGET_SLSI_VARIANT := insignal
#TARGET_SLSI_VARIANT := cm
TARGET_SOC := exynos5420

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun0/file

# Audio
BOARD_USES_LIBMEDIA_WITH_AUDIOPARAMETER := true

# Bionic
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# RIL
BOARD_PROVIDES_LIBRIL := true
# hardware/samsung/ril
BOARD_MODEM_TYPE := xmm7260

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG:= $(LOCAL_PATH)/bluetooth/libbt_vndcfg.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(TARGET_PATH)/bluetooth

# Wifi
BOARD_HAVE_SAMSUNG_WIFI          := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_NVRAM_PATH_PARAM     := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH           := "/system/etc/wifi/nvram_net.txt"

# Camera
# frameworks/av/services/camera/libcameraservice/Android.mk
# frameworks/av/services/camera/libcameraservice/device1/CameraHardwareInterface.h
# frameworks/native/libs/binder/Android.mk
# frameworks/native/include/binder/IMemory.h
# frameworks/native/libs/binder/IMemory.cpp
# OK MERGED
BOARD_NEEDS_MEMORYHEAPION := true

##ALL GLOBAL_CFLAGS SHOULD MOVE TO LOCAL_CFLAGS OR build/core/config.mk
#https://groups.google.com/forum/#!topic/android-building/U_IkbMv-_MY

# NOT USED
##COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# NOT USED
##COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE

# NOT USED
##COMMON_GLOBAL_CFLAGS += -DSAMSUNG_DVFS

# Recovery NOT USED
#COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Force the screenshot path to CPU consumer
# frameworks/native/libs/gui/SurfaceComposerClient.cpp
#COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH

# Media
# Used if using slsi-cm  # use format from fw/native
#NOT USED
#COMMON_GLOBAL_CFLAGS += -DUSE_NATIVE_SEC_NV12TILED

# NOT USED
##COMMON_GLOBAL_CFLAGS += -DWIDEVINE_PLUGIN_PRE_NOTIFY_ERROR


# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := cyanogenmod_chagalllte_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/chagalllte

# Charging mode
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_BATTERY_DEVICE_NAME := battery

# Bootloader
TARGET_OTA_ASSERT_DEVICE := chagalllte
TARGET_BOOTLOADER_BOARD_NAME := universal5420
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# FIMG2D
BOARD_USES_SKIA_FIMGAPI := true
BOARD_USES_NEON_BLITANTIH := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024
# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 5

# Renderscript
BOARD_OVERRIDE_RS_CPU_VARIANT_32 := cortex-a53

# Exynos display
BOARD_USES_VIRTUAL_DISPLAY := true

# HWCServices
BOARD_USES_HWC_SERVICES := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Init
# NOT USED
##TARGET_NR_SVC_SUPP_GIDS := 20


# OpenMAX Video
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_DMA_BUF := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_NON_CACHED_GRAPHICBUFFER := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_CSC_HW := true
BOARD_USE_QOS_CTRL := false
BOARD_USE_S3D_SUPPORT := true
BOARD_USE_VP8ENC_SUPPORT := true

# Not yet compatible with art
#WITH_DEXPREOPT := true
#DONT_DEXPREOPT_PREBUILTS := true

# If using cm vold we support exfat and ntfs
TARGET_KERNEL_HAVE_EXFAT := true
TARGET_KERNEL_HAVE_NTFS := true


#default TARGET_USERIMAGES_USE_EXT4 := true
#default BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := squashfs
#default BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

#F2FS ->
#TARGET_USERIMAGES_USE_EXT4 := false
#TARGET_USERIMAGES_USE_F2FS := true
#BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := f2fs
#F2FS <-

BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 9639936 
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2506096640
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12629049344
BOARD_FLASH_BLOCK_SIZE := 4096

# PowerHAL
TARGET_POWERHAL_VARIANT := chagalllte



BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.universal5420
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_RECOVERY_SWIPE := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true

# Scaler - OK MERGED
BOARD_USES_SCALER := true
# Used by slsi-cm
BOARD_USES_GSC_VIDEO := true

# SELinux
BOARD_SEPOLICY_DIRS += \
	device/samsung/chagall-klimt-common/sepolicy

# Seccomp filters
#BOARD_SECCOMP_POLICY += \
#	device/samsung/chagall-klimt-common/seccomp

# SurfaceFlinger - NOT USED !!!
##BOARD_USES_SYNC_MODE_FOR_MEDIA := true

# Webkit
ENABLE_WEBGL := true

# WFD
# NOT USED
##BOARD_USES_WFD_SERVICE := true
# OK MERGED
BOARD_USES_WFD := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

