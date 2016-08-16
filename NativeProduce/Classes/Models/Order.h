//
//  Order.h
//  NativeProduce
//
//  Created by 朱家权 on 16/8/4.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Order : MTLModel <MTLJSONSerializing>

/** 订单ID */
@property (nonatomic, copy, readonly) NSNumber *orderId;

/** 订单状态 */
@property (nonatomic, copy, readonly) NSNumber *state;

/** member obj class is Goods */
@property (nonatomic, strong, readonly) NSArray *goodsList;

@end


