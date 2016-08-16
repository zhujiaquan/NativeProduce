//
//  NetiveProduceApiJSONRequestOperation.m
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "NetiveProduceApiJSONRequestOperation.h"
#import "NetiveProduceApi.h"

@interface NetiveProduceApiJSONRequestOperation()

@property (readwrite, nonatomic, strong) id      responseObject;
@property (readwrite, nonatomic, strong) NSError *messagePackError;
@property (readwrite, nonatomic, strong) NSError *responseSerializationError;
@property (readwrite, nonatomic, strong) NSRecursiveLock *lock;

@end

@implementation NetiveProduceApiJSONRequestOperation

@synthesize responseObject = _responseObject;
@synthesize messagePackError = _messagePackError;
@synthesize responseSerializationError = _responseSerializationError;
@dynamic lock;

+ (BOOL)canProcessRequest:(NSURLRequest *)urlRequest {
    NSURL *testURL = [NSURL URLWithString:NetiveProduceApiBaseURL];
    if ([urlRequest.URL.host isEqualToString:testURL.host] && [urlRequest.URL.path rangeOfString:testURL.path].location == 0)
        return YES;
    
    return NO;
}

- (id)responseObject {
    [self.lock lock];
    if (!_responseObject && self.isFinished && !self.responseSerializationError && !self.messagePackError) {
        NSError *error = nil;
        self.responseObject = [self.responseSerializer responseObjectForResponse:self.response data:self.responseData error:&error];
        if (error) {
            self.responseSerializationError = error;
        }
        else {
            NSString *errorMessage = [self.responseObject objectForKey:@"message"];
            NSUInteger errorCode = NetiveProduceApiErrorJSON;
            if ([self.responseObject objectForKey:@"error"] && errorMessage) {
                NSString *error = [self.responseObject objectForKey:@"error"];
                if ([error isEqualToString:@"invalid_token"]) {
                    errorCode = NetiveProduceApiErrorInvalidToken;
                } else if ([error isEqualToString:@"authorization_required"]) {
                    errorCode = NetiveProduceApiErrorAuthorizationRequired;
                }
                return [NSError errorWithDomain:NetiveProduceApiErrorDomain
                                           code:errorCode
                                       userInfo:@{NSLocalizedDescriptionKey: errorMessage, NetiveProduceApiErrorCodeKey: error}];
            }
        }
    }
    [self.lock unlock];
    return _responseObject;
}

- (NSError *)error {
    if (_responseSerializationError) {
        return _responseSerializationError;
    }
    else if (_messagePackError){
        return _messagePackError;
    }
    else {
        return [super error];
    }
}

@end
