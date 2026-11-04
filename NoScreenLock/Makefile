export ARCHS = arm64 arm64e
export TARGET = iphone:clang:latest:15.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoScreenLock
NoScreenLock_FILES = Tweak.xm Settings/SettingsController.m
NoScreenLock_FRAMEWORKS = UIKit CoreGraphics
NoScreenLock_PRIVATE_FRAMEWORKS = Preferences
NoScreenLock_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
