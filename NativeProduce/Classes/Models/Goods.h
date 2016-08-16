//
//  Goods.h
//  NativeProduce
//
//  Created by 朱家权 on 16/8/4.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Goods : MTLModel <MTLJSONSerializing>

/** 商品ID */
@property (nonatomic, copy, readonly) NSNumber *goodsId;

/** 商品名 */
@property (nonatomic, copy, readonly) NSString *goodsName;

@end
