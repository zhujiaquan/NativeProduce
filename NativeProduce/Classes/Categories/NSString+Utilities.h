//
//  NSString+Utilities.h
//  NativeProduce
//
//  Created by 朱家权 on 16/8/1.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utilities)

+ (BOOL)isNilOrEmpty:(NSString *)string;
+ (BOOL)isNilOrEmptyOrWhitespace:(NSString *)string;

+ (NSString *)nonNullString:(NSString *)string;
+ (NSString *)nonEmptyStringOrNil:(NSString *)string;
+ (NSString *)nonEmptyTrimmedStringOrNil:(NSString *)string;

- (BOOL)contains:(NSString *)substring;
- (NSArray *)splitByString:(NSString *)string;

+ (NSUInteger)unicodeLengthOfString: (NSString *) text;
+ (NSUInteger)asciiLengthOfString: (NSString *) text;

- (NSMutableAttributedString *)renderString:(NSString *)renderString withColor:(UIColor *)renderColor;

@end
