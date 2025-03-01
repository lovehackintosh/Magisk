APP_BUILD_SCRIPT := src/Android.mk
APP_ABI          := armeabi-v7a arm64-v8a x86 x86_64
APP_CFLAGS       := -Wall -Ofast -fomit-frame-pointer -flto -march=armv8-a+crypto+crc
APP_LDFLAGS      := -flto
APP_CPPFLAGS     := -std=c++20
APP_STL          := none
APP_PLATFORM     := android-30
APP_THIN_ARCHIVE := true
APP_STRIP_MODE   := --strip-all

# Busybox should use stock libc.a
ifdef B_BB
APP_PLATFORM     := android-30
APP_LDFLAGS      += -T src/lto_fix.lds
ifeq ($(OS),Windows_NT)
APP_SHORT_COMMANDS := true
endif
endif
