//
//  Goods.m
//  NativeProduce
//
//  Created by 朱家权 on 16/8/4.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "Goods.h"

@implementation Goods

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"goodsId" : @"goodsId",
             @"goodsName" : @"goodsName",
             };
}

@end
