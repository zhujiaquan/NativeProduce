//
//  PingYingHelper.m
//  NativeProduce
//
//  Created by 朱家权 on 16/8/10.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "PingYingHelper.h"

@implementation PingYingHelper

+ (NSString *)firstLetter:(NSString *)aString {
    // 转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    // 先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin,NO);
    // 再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics,NO);
    // 转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    // 获取并返回首字母
    return [pinYin substringToIndex:1];
}

+ (NSString *)firstCharactor:(NSString *)aString
{
    // 转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    // 先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin,NO);
    // 再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics,NO);
    // 转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    
    NSArray *arr = [pinYin componentsSeparatedByString:NSLocalizedString(@" ", nil)];
    
    NSString *result = [NSString string];
    for (int i = 0; i < [arr count]; i++) {
        result = [result stringByAppendingString:[arr[i] substringToIndex:1]];
    }
    
    return result;
}

@end
