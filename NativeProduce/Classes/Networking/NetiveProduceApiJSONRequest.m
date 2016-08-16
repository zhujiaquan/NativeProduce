//
//  NetiveProduceApiJSONRequest.m
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "NetiveProduceApiJSONRequest.h"
#import "NetiveProduceApiJSONRequestOperationManager.h"
#import "NetiveProduceApi.h"

@interface NetiveProduceApiJSONRequest()

- (AFHTTPRequestOperationManager *)createHTTPRequestOperationManager;
- (AFHTTPRequestSerializer <AFURLRequestSerialization> *)createRequestSerializer;
- (AFHTTPResponseSerializer <AFURLResponseSerialization> *)createResponseSerializer;

@end

@implementation NetiveProduceApiJSONRequest

/**
 * 创建 NetiveProduceApiJSONRequestOperationManager
 */
- (AFHTTPRequestOperationManager *)createHTTPRequestOperationManager {
    
    NSURL* baseURL = [NSURL URLWithString:NetiveProduceApiBaseURL];
    
    AFHTTPRequestOperationManager *operationManager = [[NetiveProduceApiJSONRequestOperationManager alloc] initWithBaseURL:baseURL];
    operationManager.requestSerializer  = [self createRequestSerializer];
    operationManager.responseSerializer = [self createResponseSerializer];
    
    return operationManager;
}

/**
 * 创建AFHTTPRequestSerializer 
 * 设置 http header
 */
- (AFHTTPRequestSerializer <AFURLRequestSerialization> *)createRequestSerializer {
    AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer new];
    
    requestSerializer.timeoutInterval = 30.0f;
    NSString *applicationUserAgent = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserAgent"];
    if (applicationUserAgent) {
        [requestSerializer setValue:applicationUserAgent forHTTPHeaderField:@"User-Agent"];
    } else {
        [requestSerializer setValue:[NSString stringWithFormat:@"%@/%@ (%@, %@ %@, %@, Scale/%f)", [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleIdentifierKey], [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey], @"unknown", [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion], [[UIDevice currentDevice] model], ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] ? [[UIScreen mainScreen] scale] : 1.0)] forHTTPHeaderField:@"User-Agent"];
    }
    
    [requestSerializer setValue:@"application/json; encoding=utf-8" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    return requestSerializer;
}

- (AFHTTPResponseSerializer <AFURLResponseSerialization> *)createResponseSerializer {
    AFHTTPResponseSerializer *responseSerializer = [AFJSONResponseSerializer new];
    return responseSerializer;
}

/**
 * GET请求
 */
- (void)GET:(NSString *)URLString parameters:(id)parameters success:(RequestSuccessBlock)successHandler failure:(RequestFailureBlock)failureHandler {
    AFHTTPRequestOperationManager *operationManager = [self createHTTPRequestOperationManager];
    [operationManager GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successHandler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureHandler(error);
    }];
}

/**
 * POST请求
 */
- (void)POST:(NSString *)URLString parameters:(id)parameters success:(RequestSuccessBlock)successHandler failure:(RequestFailureBlock)failureHandler {
    AFHTTPRequestOperationManager *operationManager = [self createHTTPRequestOperationManager];
    [operationManager POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successHandler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureHandler(error);
    }];
}

/**
 * PUT请求
 */
- (void)PUT:(NSString *)URLString parameters:(id)parameters success:(RequestSuccessBlock)successHandler failure:(RequestFailureBlock)failureHandler {
    AFHTTPRequestOperationManager *operationManager = [self createHTTPRequestOperationManager];
    [operationManager PUT:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successHandler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureHandler(error);
    }];
}

/**
 * DELETE请求
 */
- (void)DELETE:(NSString *)URLString parameters:(id)parameters success:(RequestSuccessBlock)successHandler failure:(RequestFailureBlock)failureHandler {
    AFHTTPRequestOperationManager *operationManager = [self createHTTPRequestOperationManager];
    [operationManager DELETE:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successHandler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureHandler(error);
    }];
}

@end
