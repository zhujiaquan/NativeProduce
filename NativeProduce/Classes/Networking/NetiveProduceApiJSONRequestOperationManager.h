//
//  NetiveProduceApiJSONRequestOperationManager.h
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetiveProduceApiJSONRequestOperationManager : AFHTTPRequestOperationManager

- (id)initWithBaseURL:(NSURL *)url;

@end
