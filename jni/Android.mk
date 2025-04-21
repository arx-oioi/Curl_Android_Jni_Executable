LOCAL_PATH := $(call my-dir)

LOCAL_MODULE := libcurl
LOCAL_SRC_FILES := curl/curl-android-$(TARGET_ARCH_ABI)/lib/libcurl.a
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)

LOCAL_MODULE := libssl
LOCAL_SRC_FILES := curl/openssl-android-$(TARGET_ARCH_ABI)/lib/libssl.a
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)

LOCAL_MODULE := libcrypto
LOCAL_SRC_FILES := curl/openssl-android-$(TARGET_ARCH_ABI)/lib/libcrypto.a
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)

# debug

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/curl/curl-android-$(TARGET_ARCH_ABI)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/curl/openssl-android-$(TARGET_ARCH_ABI)/include

LOCAL_MODULE := openssl-curl-test
LOCAL_SRC_FILES := debug.cpp


LOCAL_CFLAGS := -Wno-error=format-security -fvisibility=hidden -ffunction-sections -fdata-sections -w -fno-rtti -fno-exceptions -fpermissive
LOCAL_CPPFLAGS := -Wno-error=format-security -fvisibility=hidden -ffunction-sections -fdata-sections -w -Werror -s -std=c++17 -Wno-error=c++11-narrowing -fms-extensions -fno-rtti -fno-exceptions -fpermissive

LOCAL_LDFLAGS += -Wl,--gc-sections -llog
LOCAL_STATIC_LIBRARIES := libcurl libssl libcrypto
LOCAL_LDLIBS := -llog -landroid -lz

LOCAL_ARM_MODE := arm
LOCAL_CPP_FEATURES := exceptions
include $(BUILD_EXECUTABLE)
