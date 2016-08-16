//
//  Order.m
//  NativeProduce
//
//  Created by 朱家权 on 16/8/4.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "Order.h"
#import "Goods.h"

@interface Order ()

@property (nonatomic, strong) NSArray *goodsList;

@end

@implementation Order

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"orderId" : @"orderId",
             @"state" : @"state",
             @"goodsList" : @"goodsList"
             };
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    return self;
}

+ (NSValueTransformer *)goodsListJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Goods class]];
}

@end
