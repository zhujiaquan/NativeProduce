//
//  UIDevice+Helpers.m
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "UIDevice+Helpers.h"

static NSString * const NativeProduceIdentifierDefaultsKey = @"NativeProduceIdentifier";

@implementation UIDevice (Helpers)

- (NSString *)nativeProduceIdentifier {
    NSString *uuid;
    if ([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
        uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    } else {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        uuid = [defaults objectForKey:NativeProduceIdentifierDefaultsKey];
        if (!uuid) {
            uuid = [self generateUUID];
            [defaults setObject:uuid forKey:NativeProduceIdentifierDefaultsKey];
            [defaults synchronize];
        }
    }
    return uuid;
}

- (NSString *)generateUUID {
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge_transfer NSString *)string;
}

@end
