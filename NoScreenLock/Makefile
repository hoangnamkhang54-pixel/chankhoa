include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoScreenLock
NoScreenLock_FILES = Tweak.xm Settings/SettingsController.m
NoScreenLock_FRAMEWORKS = UIKit CoreGraphics
NoScreenLock_EXTRA_FRAMEWORKS = PreferenceBundleSupport
NoScreenLock_IPHONE_ARCHS = arm64 arm64e

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	sudo chown -R mobile:mobile $(THEOS_STAGING_DIR)
