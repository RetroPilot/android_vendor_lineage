LOCAL_PATH := $(call my-dir)

################################
# Copies the APN list file into $(TARGET_COPY_OUT_PRODUCT)/etc for the product as apns-conf.xml.
# In the case where $(CUSTOM_APNS_FILE) is defined, the content of $(CUSTOM_APNS_FILE)
# is added or replaced to the $(DEFAULT_APNS_FILE).
include $(CLEAR_VARS)

LOCAL_MODULE := apns-conf.xml
LOCAL_MODULE_CLASS := ETC

DEFAULT_APNS_FILE := vendor/lineage/prebuilt/common/etc/apns-conf.xml

ifdef CUSTOM_APNS_FILE
CUSTOM_APNS_SCRIPT := vendor/lineage/tools/custom_apns.py
FINAL_APNS_FILE := $(local-generated-sources-dir)/apns-conf.xml

$(FINAL_APNS_FILE): PRIVATE_SCRIPT := $(CUSTOM_APNS_SCRIPT)
$(FINAL_APNS_FILE): PRIVATE_CUSTOM_APNS_FILE := $(CUSTOM_APNS_FILE)
$(FINAL_APNS_FILE): $(CUSTOM_APNS_SCRIPT) $(DEFAULT_APNS_FILE)
	rm -f $@
	python $(PRIVATE_SCRIPT) $@ $(PRIVATE_CUSTOM_APNS_FILE)
else
FINAL_APNS_FILE := $(DEFAULT_APNS_FILE)
endif

LOCAL_PREBUILT_MODULE_FILE := $(FINAL_APNS_FILE)

LOCAL_PRODUCT_MODULE := true

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fonts_customization.xml
LOCAL_SRC_FILES := etc/fonts_customization.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)

# RetrOS
# RetrOS packages

include $(CLEAR_VARS)
LOCAL_MODULE := OpenCamera
LOCAL_MODULE_OWNER := lineage
LOCAL_SRC_FILES := priv-app/opencamera/OpenCamera.apk
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_SUFFIX := .apk
LOCAL_PRIVILEGED_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := Termux
LOCAL_MODULE_OWNER := lineage
LOCAL_SRC_FILES := priv-app/termux/termux.apk
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_SUFFIX := .apk
LOCAL_PRIVILEGED_MODULE := true
include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE := TermuxApi
# LOCAL_MODULE_OWNER := lineage
# LOCAL_SRC_FILES := priv-app/termux_api/termuxapi.apk
# LOCAL_CERTIFICATE := platform
# LOCAL_MODULE_TAGS := optional
# LOCAL_MODULE_CLASS := APPS
# LOCAL_DEX_PREOPT := false
# LOCAL_MODULE_SUFFIX := .apk
# LOCAL_PRIVILEGED_MODULE := true
# include $(BUILD_PREBUILT)

# include $(CLEAR_VARS)
# LOCAL_MODULE := Flowpilot
# LOCAL_MODULE_OWNER := lineage
# LOCAL_SRC_FILES := priv-app/flowpilot/android-release.apk
# LOCAL_CERTIFICATE := platform
# LOCAL_MODULE_TAGS := optional
# LOCAL_MODULE_CLASS := APPS
# LOCAL_DEX_PREOPT := false
# LOCAL_MODULE_SUFFIX := .apk
# LOCAL_PRIVILEGED_MODULE := true
# include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := privapp-permissions-retropilot.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_SRC_FILES:= etc/permissions/privapp-permissions-retropilot.xml
include $(BUILD_PREBUILT)
