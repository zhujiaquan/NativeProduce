//
//  Country.h
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Country : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *countryName;
@property (nonatomic, copy, readonly) NSString *countryCode;
@property (nonatomic, copy, readonly) NSNumber *south;
@property (nonatomic, copy, readonly) NSNumber *north;
@property (nonatomic, copy, readonly) NSNumber *west;
@property (nonatomic, copy, readonly) NSNumber *east;

@end
