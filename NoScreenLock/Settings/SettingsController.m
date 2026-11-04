#import <Preferences/PSListController.h>

@interface DADRootListController : PSListController
@end

@implementation DADRootListController

- (NSArray *)specifiers {
    NSString *plist = [self pathForPlist];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plist]) {
        NSDictionary *defaults = @{@"DisableScreenLock": @NO};
        [defaults writeToFile:p plist atomically:YES];
    }
    return [[self privateBundlespecifiers] mutableCopy];
}

- (NSString *)pathForPlist {
    return @"/var/mobile/Library/Preferences/com.dadgpt.noscreenlock.plist";
}

@end

// Chắc chắn load được — không có thì tạo!
%ctor {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL,
                                    NULL,
                                    CFSTR("com.dadgpt.settings.changed"),
                                    NULL,
                                    CFNotificationSuspensionBehaviorDeliverImmediately);
}
