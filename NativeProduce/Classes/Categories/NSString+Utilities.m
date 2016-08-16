//
//  NSString+Utilities.m
//  NativeProduce
//
//  Created by 朱家权 on 16/8/1.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "NSString+Utilities.h"

@implementation NSString (Utilities)

+ (BOOL)isNilOrEmpty:(NSString *)string {
    return (string == nil ||
            [string isEqual:[NSNull null]] ||
            [string isEqual:nil] ||
            [string length] <= 0);
}

+ (BOOL)isNilOrEmptyOrWhitespace:(NSString *)string {
    return (string == nil ||
            [string isEqual:[NSNull null]] ||
            [string isEqual:nil] ||
            [[string trim] length] <= 0);
}

+ (NSString *)nonNullString:(NSString *)string {
    return (string ? string : [NSString string]);
}

+ (NSString *)nonEmptyStringOrNil:(NSString *)string {
    if ([self isNilOrEmpty:string]) {
        return nil;
    }
    return string;
}

+ (NSString *)nonEmptyTrimmedStringOrNil:(NSString *)string {
    if ([self isNilOrEmptyOrWhitespace:string]){
        return nil;
    }
    return [string trim];
}

- (BOOL)contains:(NSString *)substring {
    return ([self rangeOfString:substring].location != NSNotFound);
}

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSArray *)splitByString:(NSString *)string {
    return [self componentsSeparatedByString:string];
}

+ (NSUInteger)unicodeLengthOfString: (NSString *) text {
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < text.length; i++) {
        unichar uc = [text characterAtIndex: i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    
    NSUInteger unicodeLength = asciiLength / 2;
    if(asciiLength % 2) {
        unicodeLength++;
    }
    return unicodeLength;
}

+ (NSUInteger)asciiLengthOfString: (NSString *) text {
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < text.length; i++) {
        unichar uc = [text characterAtIndex: i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    
    NSUInteger unicodeLength = asciiLength / 2;
    if(asciiLength % 2) {
        unicodeLength++;
    }
    return asciiLength;
}

- (NSMutableAttributedString *)renderString:(NSString *)renderString withColor:(UIColor *)renderColor {
    NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:self];
    [mStr addAttribute:NSForegroundColorAttributeName value:renderColor range:[self rangeOfString:renderString]];
    return mStr;
}

@end
