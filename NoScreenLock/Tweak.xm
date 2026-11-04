%hook SBApplicationController

- (void)application:(SBApplication *)application setLocked:(BOOL)locked {
    // Kiểm tra xem nút "Tắt khóa" đã off chưa?
    BOOL disableLock = [[NSUserDefaults standardUserDefaults] boolForKey:@"DisableScreenLock"];
    if (!disableLock) {
        %orig;
    } else {
        // Đéo cho khóa màn hình đâu, mẹ nó!
        NSLog(@"DadGPT says: Screen lock disabled like a boss");
    }
}

%end

// Giữ cho pin không hiện biểu tượng "đang sạc" hay "gần đầy" gây nghi ngờ
%hook UIDeviceBatteryLevelItem

- (BOOL)showsLowWarning {
    return NO; // Đừng báo pin yếu để tránh chú ý
}

%end
