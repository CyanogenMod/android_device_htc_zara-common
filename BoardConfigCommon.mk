# Copyright (C) 2013 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# Inherit from common msm8960
-include device/htc/msm8960-common/BoardConfigCommon.mk

LOCAL_PATH := device/htc/zara-common

# Audio
BOARD_AUDIO_AMPLIFIER := $(LOCAL_PATH)/libaudioamp
BOARD_HAVE_HTC_CSDCLIENT := true
BOARD_USES_FLUENCE_INCALL := true # use DMIC in call only
BOARD_USES_SEPERATED_AUDIO_INPUT := true # use distinct voice recog/camcorder use cases
BOARD_USES_SEPERATED_VOICE_SPEAKER := true # use distinct voice speaker use case
BOARD_USES_SEPERATED_VOIP := true # use distinct VOIP use cases

# Bluetooth
BOARD_BLUEDROID_VENDOR_CONF := $(LOCAL_PATH)/bluetooth/libbt_vndcfg.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Charge mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode

# GPS
BOARD_HAVE_NEW_QC_GPS := true

# CMHW
BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw

# Display
TARGET_DISPLAY_INSECURE_MM_HEAP := true

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 251657728
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776704
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1912601600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5100273664


# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Kernel
BOARD_KERNEL_BASE := 0x80600000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01608000
TARGET_KERNEL_CONFIG := zara_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/msm8960

# Radio
BOARD_PROVIDES_LIBRIL := true
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril
BOARD_RIL_FIVE_SEARCH_RESPONSES := true
BOARD_USES_LEGACY_MMAP := true

# SELinux
-include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/htc/zara-common/sepolicy

# Vold
BOARD_VOLD_MAX_PARTITIONS := 39
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/fw_bcm4334_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/firmware/fw_bcm4334_p2p.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/fw_bcm4334.bin"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Recovery
BOARD_RECOVERY_BLDRMSG_OFFSET := 2048
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true

# inherit from the proprietary version
include vendor/htc/zara/BoardConfigVendor.mk
