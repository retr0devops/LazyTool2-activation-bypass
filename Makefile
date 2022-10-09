TARGET := iphone:clang:latest:7.0


include ~/theos/makefiles/common.mk

TWEAK_NAME = LazyHackbyRetr0

LazyHackbyRetr0_FILES = Tweak.x
LazyHackbyRetr0_CFLAGS = -fobjc-arc

include ~/theos/makefiles/tweak.mk
