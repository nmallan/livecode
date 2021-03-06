APP_BUILD_SCRIPT := $(call my-dir)/Android.mk

APP_PLATFORM := android-8

# NOTE: Default CPP settings add no-exceptions no-rtti so don't need to specify

ifeq ($(MODE),debug)

APP_PROJECT_PATH := $(call my-dir)/_build/android/debug

APP_OPTIM := debug
#APP_CPPFLAGS += -D_MOBILE -DTARGET_PLATFORM_MOBILE -DTARGET_SUBPLATFORM_ANDROID -D_DEBUG -fvisibility=hidden -g
APP_CFLAGS += -D_MOBILE -DTARGET_PLATFORM_MOBILE -DTARGET_SUBPLATFORM_ANDROID -D_DEBUG -DANDROID_NDK -fvisibility=hidden -g
APP_STL := gnustl_static

# ICU needs some of the STL that Bionic doesn't provide
APP_STL := gnustl_static

else

APP_PROJECT_PATH := $(call my-dir)/_build/android/release

APP_OPTIM := release
#APP_CPPFLAGS += -D_MOBILE -DTARGET_PLATFORM_MOBILE -DTARGET_SUBPLATFORM_ANDROID -D_RELEASE -DNDEBUG -fvisibility=hidden -g
APP_CFLAGS += -D_MOBILE -DTARGET_PLATFORM_MOBILE -DTARGET_SUBPLATFORM_ANDROID -D_RELEASE -DANDROID_NDK -DNDEBUG -fvisibility=hidden -g

# ICU needs some of the STL that Bionic doesn't provide
APP_STL := gnustl_static

endif
