//
//  NetiveProduceApi+CountriesFetcher.h
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "NetiveProduceApi.h"

@interface NetiveProduceApi (CountriesFetcher)

- (void)GetCountriesWithSuccess:(void (^)(NSArray *array))success failure:(void (^)(NSError *error))failure;

@end
