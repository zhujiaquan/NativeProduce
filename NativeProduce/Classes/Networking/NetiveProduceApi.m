//
//  NetiveProduceApi.m
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "NetiveProduceApi.h"

NSString *const NetiveProduceApiBaseURL      = @"http://api.geonames.org/";
NSString *const NetiveProduceApiErrorDomain  = @"NetiveProduceApiError";
NSString *const NetiveProduceApiErrorCodeKey = @"NetiveProduceApiErrorCodeKey";

@interface NetiveProduceApi ()

@property (nonatomic, strong) NetiveProduceApiJSONRequest *netiveProduceApiJSONRequest;

@end

@implementation NetiveProduceApi

@synthesize netiveProduceApiJSONRequest = _netiveProduceApiJSONRequest;

#pragma mark - Class Methods

+ (NetiveProduceApi *)sharedInstance {
    static NetiveProduceApi *_sharedInstance;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (NetiveProduceApiJSONRequest *)netiveProduceApiJSONRequest {
    if (_netiveProduceApiJSONRequest == nil) {
        _netiveProduceApiJSONRequest = [NetiveProduceApiJSONRequest new];
    }
    return _netiveProduceApiJSONRequest;
}

@end
