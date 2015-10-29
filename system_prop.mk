# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=240

# Performance
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.extension_library=/system/lib/libqc-opt.so

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.baseband.arch=msm \
    ro.telephony.ril_class=HTCQualcommRIL

# Time services
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true