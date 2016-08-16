//
//  NetiveProduceApiJSONRequestOperationManager.m
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "NetiveProduceApiJSONRequestOperationManager.h"
#import "NetiveProduceApiJSONRequestOperation.h"

@implementation NetiveProduceApiJSONRequestOperationManager

- (id)initWithBaseURL:(NSURL *)url {
    NSParameterAssert([url isKindOfClass:[NSURL class]]);
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.requestSerializer.timeoutInterval = 30.0f;
        
        NSString *applicationUserAgent = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserAgent"];
        if (applicationUserAgent) {
            [self.requestSerializer setValue:applicationUserAgent forHTTPHeaderField:@"User-Agent"];
        } else {
            [self.requestSerializer setValue:[NSString stringWithFormat:@"%@/%@ (%@, %@ %@, %@, Scale/%f)", [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleIdentifierKey], [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey], @"unknown", [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion], [[UIDevice currentDevice] model], ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] ? [[UIScreen mainScreen] scale] : 1.0)] forHTTPHeaderField:@"User-Agent"];
        }
    }
    return self;
}

- (AFHTTPRequestOperation *)HTTPRequestOperationWithRequest:(NSURLRequest *)request
                                                    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {

    NSLog(@"allHTTPHeaderFields = %@", request.allHTTPHeaderFields);
    
    NetiveProduceApiJSONRequestOperation *operation = [[NetiveProduceApiJSONRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer = self.responseSerializer;;
    operation.shouldUseCredentialStorage = self.shouldUseCredentialStorage;
    operation.credential = self.credential;
    operation.securityPolicy = self.securityPolicy;
    
    [operation setCompletionBlockWithSuccess:success failure:failure];
    
    return operation;
}

@end
