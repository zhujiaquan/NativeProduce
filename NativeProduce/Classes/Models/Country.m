//
//  Country.m
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "Country.h"
#import "NSValueTransformer+CustomPredefinedTransformerAdditions.h"

@implementation Country

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"countryName" : @"countryName",
             @"countryCode" : @"countryCode",
             @"south" : @"south",
             @"north" : @"north",
             @"west"  : @"west",
             @"east"  : @"east"
             };
}

+ (NSValueTransformer *)countryNameJSONTransformer {
    return [MTLValueTransformer valueTransformerForName:CustomStringValueTransformerName];
}

+ (NSValueTransformer *)countryCodeJSONTransformer {
    return [MTLValueTransformer valueTransformerForName:CustomStringValueTransformerName];
}

+ (NSValueTransformer *)southJSONTransformer {
    return [MTLValueTransformer valueTransformerForName:CustomNumberValueTransformerName];
}

+ (NSValueTransformer *)northJSONTransformer {
    return [MTLValueTransformer valueTransformerForName:CustomNumberValueTransformerName];
}

+ (NSValueTransformer *)westJSONTransformer {
    return [MTLValueTransformer valueTransformerForName:CustomNumberValueTransformerName];
}

+ (NSValueTransformer *)eastSONTransformer {
    return [MTLValueTransformer valueTransformerForName:CustomNumberValueTransformerName];
}

@end
