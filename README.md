# Curl_Android_Jni_Executable 

[![Android NDK](https://github.com/arx-oioi/Curl_Android_Jni_Executable/actions/workflows/cpp.yml/badge.svg)](https://github.com/arx-oioi/Curl_Android_Jni_Executable/actions/workflows/cpp.yml)


## โปรเจกต์นี้เป็นการ build curl สำหรับใช้งานบน Android ผ่าน JNI (Java Native Interface) โดยรองรับการรัน curl แบบ executable Android ด้วย native C/C++ และ NDK

## คุณสมบัติ

- สร้างไฟล์ curl executable สำหรับ Android (รองรับ armeabi-v7a และ arm64-v8a X86 X86_64)
- ใช้งานร่วมกับ JNI เพื่อรันคำสั่ง curl จากฝั่ง Java/Kotlin
- รองรับ HTTPS และ HTTP2)

## ใช้สำหรับ C ที่ต้องการใช้งาน ออนไลน์ แบบ login / download
- nghttp2 โปรดรอสักครู่


### For Android

Copy `lib/armeabi` folder and `lib/armeabi-v7a` folder and `lib/x86` to your android project `libs` folder.

Copy `include/openssl` folder and `include/curl` to your android project.

#### Android Makefile
Add openssl include path to `jni/Android.mk`. 

```
#Android.mk

include $(CLEAR_VARS)

LOCAL_MODULE := curl
LOCAL_SRC_FILES := Your cURL Library Path/$(TARGET_ARCH_ABI)/libcurl.a
include $(PREBUILT_STATIC_LIBRARY)


LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/Your Openssl Include Path/openssl \
	$(LOCAL_PATH)/Your cURL Include Path/curl

LOCAL_STATIC_LIBRARIES := libcurl

LOCAL_LDLIBS := -lz
	
```

 [OpenSSL & cURL Library for iOS and Android](https://github.com/leenjewel/openssl_for_ios_and_android)
