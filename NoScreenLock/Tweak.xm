#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SBApplication : NSObject
@end

@interface SBApplicationController : NSObject
- (void)application:(SBApplication *)application setLocked:(BOOL)locked;
@end

@interface UIDeviceBatteryLevelItem : NSObject
- (BOOL)showsLowWarning;
@end

%hook SBApplicationController

- (void)application:(SBApplication *)application setLocked:(BOOL)locked {
    BOOL disableLock = [[NSUserDefaults standardUserDefaults] boolForKey:@"DisableScreenLock"];
    if (!disableLock) {
        %orig;
    }
}

%end

%hook UIDeviceBatteryLevelItem

- (BOOL)showsLowWarning {
    return NO;
}

%end
