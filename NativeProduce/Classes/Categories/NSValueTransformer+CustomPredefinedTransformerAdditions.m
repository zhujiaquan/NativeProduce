//
//  NSValueTransformer+CustomPredefinedTransformerAdditions.m
//  NativeProduce
//
//  Created by 朱家权 on 16/8/1.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "NSValueTransformer+CustomPredefinedTransformerAdditions.h"
#import <Mantle/Mantle.h>

NSString * const CustomStringValueTransformerName = @"CustomStringValueTransformerName";
NSString * const CustomNumberValueTransformerName = @"CustomNumberValueTransformerName";

@implementation NSValueTransformer (CustomPredefinedTransformerAdditions)

#pragma mark Category Loading

+ (void)load {
    @autoreleasepool {
        MTLValueTransformer *stringValueTransformer = [MTLValueTransformer
                                                       reversibleTransformerWithBlock:^ id (id str) {
                                                           if (str == nil || str == NSNull.null)
                                                               return nil;
                                                           if ([str isKindOfClass:NSString.class])
                                                               return str;
                                                           if ([str isKindOfClass:NSNumber.class])
                                                               return [str description];
                                                           return nil;
                                                       }];
        
        [NSValueTransformer setValueTransformer:stringValueTransformer forName:CustomStringValueTransformerName];
        
        MTLValueTransformer *numberValueTransformer = [MTLValueTransformer
                                                        reversibleTransformerWithBlock:^ id (id number) {
                                                            if (number == nil || number == NSNull.null)
                                                                return nil;
                                                            if ([number isKindOfClass:NSNumber.class])
                                                                return number;
                                                            if ([number isKindOfClass:NSString.class]) {
                                                                NSNumberFormatter *fm = [[NSNumberFormatter alloc] init];
                                                                return [fm numberFromString:number];
                                                            }
                                                            return nil;
                                                        }];
        
        [NSValueTransformer setValueTransformer:numberValueTransformer forName:CustomNumberValueTransformerName];
    }
}

@end
