//
//  GCDDispatch.h
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef DISPATCH_H_
#define DISPATCH_H_

#pragma mark - GCD

static inline void DispatchAsync(dispatch_block_t block)
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

static inline void DispatchAsyncAfter(double seconds, dispatch_block_t block)
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (seconds) * NSEC_PER_SEC),
                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   block);
}

static inline void DispatchUI(dispatch_block_t block)
{
    if ([NSThread isMainThread]){
        block();
    }
    else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

static inline void DispatchUIAfter(double seconds, dispatch_block_t block)
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (seconds) * NSEC_PER_SEC),
                   dispatch_get_main_queue(),
                   block);
}

#endif /* DISPATCH_H_ */
