//
//  NetiveProduceApiJSONRequest.h
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RequestSuccessBlock)(id responseObject);
typedef void (^RequestFailureBlock) (NSError *error);

@interface NetiveProduceApiJSONRequest : NSObject

/**
 * @brief GET请求
 */
- (void)GET:(NSString *)URLString parameters:(id)parameters success:(RequestSuccessBlock)successHandler failure:(RequestFailureBlock)failureHandler;

/**
 * @brief POST请求
 */
- (void)POST:(NSString *)URLString parameters:(id)parameters success:(RequestSuccessBlock)successHandler failure:(RequestFailureBlock)failureHandler;

/**
 * @brief PUT请求
 */
- (void)PUT:(NSString *)URLString parameters:(id)parameters success:(RequestSuccessBlock)successHandler failure:(RequestFailureBlock)failureHandler;

/**
 * @brief DELETE请求
 */
- (void)DELETE:(NSString *)URLString parameters:(id)parameters success:(RequestSuccessBlock)successHandler failure:(RequestFailureBlock)failureHandler;

@end
