      - name: Build
        working-directory: NoScreenLock
        run: |
          export ARCHS="arm64 arm64e"
          export TARGET_IPHONEOS_DEPLOYMENT_VERSION=15.0
          rm -f Makefile Makeflie makefile GNUmakefile
          printf '%s\n' \
            'export ARCHS = arm64 arm64e' \
            'export TARGET = iphone:clang:latest:15.0' \
            '' \
            'include $(THEOS)/makefiles/common.mk' \
            '' \
            'TWEAK_NAME = NoScreenLock' \
            'NoScreenLock_FILES = Tweak.xm' \
            'NoScreenLock_FRAMEWORKS = UIKit CoreGraphics' \
            'NoScreenLock_CFLAGS = -fobjc-arc' \
            '' \
            'include $(THEOS_MAKE_PATH)/tweak.mk' > Makefile
          echo "=== LOGOS ==="
          "$THEOS/vendor/logos/bin/logos.pl" Tweak.xm > /tmp/out.mm; echo "logos exit: $?"
          echo "=== MAKE ==="
          set +e
          make clean package FINALPACKAGE=1 messages=yes THEOS_PARALLEL_BUILDING=no > build.log 2>&1
          echo "make exit: $?"
          tail -n 60 build.log
          set -e
          mkdir -p "$GITHUB_WORKSPACE/out"
          cp packages/*.deb "$GITHUB_WORKSPACE/out/"
