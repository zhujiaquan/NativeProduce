//
//  NetiveProduceApi.h
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifndef _NETIVEPRODUCEAPI
#define _NETIVEPRODUCEAPI
#import "NetiveProduceApiJSONRequest.h"
#import "TranslatorHelper.h"
#endif /* _NETIVEPRODUCEAPI */


typedef NS_ENUM(NSUInteger, NetiveProduceApiError) {
    NetiveProduceApiErrorJSON,
    NetiveProduceApiErrorNoAccessToken,
    NetiveProduceApiErrorLoginFailed,
    NetiveProduceApiErrorInvalidToken,
    NetiveProduceApiErrorAuthorizationRequired,
};

extern NSString *const NetiveProduceApiBaseURL;
extern NSString *const NetiveProduceApiErrorDomain;
extern NSString *const NetiveProduceApiErrorCodeKey;

/**
 * @brief 土货网路请求API
 */
@interface NetiveProduceApi : NSObject

/** 网路请求成员 */
@property (nonatomic, strong, readonly) NetiveProduceApiJSONRequest *netiveProduceApiJSONRequest;

+ (NetiveProduceApi *)sharedInstance;

@end
