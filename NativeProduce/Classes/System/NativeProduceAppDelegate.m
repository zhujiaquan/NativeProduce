//
//  NativeProduceAppDelegate.m
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "NativeProduceAppDelegate.h"
#import "HomeViewController.h"
#import "TranslatorHelper.h"
#import "Order.h"
#import "PingYingHelper.h"

@interface NativeProduceAppDelegate ()

@end

@implementation NativeProduceAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    NSArray *orderList = @[
                           @{
                               @"orderId":@(1001),
                               @"state":@(1),
                               @"goodsList":@[
                                       @{@"goodsId":@(1001),@"goodsName":@"海飞丝"},
                                       @{@"goodsId":@(1002),@"goodsName":@"飘柔"}
                                       ]
                               },
                           @{
                               @"orderId":@(1002),
                               @"state":@(1),
                               @"goodsList":@[
                                       @{@"goodsId":@(1003),@"goodsName":@"冬瓜"},
                                       @{@"goodsId":@(1004),@"goodsName":@"南瓜"}
                                       ]
                               }
                           ];
    
    NSArray *array = [TranslatorHelper translateCollectionFromJSON:orderList withModelClass:[Order class]];
    [array enumerateObjectsUsingBlock:^(Order *order, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"------------->");
        NSLog(@"orderId:%@", [order.orderId description]);
        NSLog(@"state:%@", [order.state description]);
        NSLog(@"goodsList:%@", [order.goodsList description]);
        NSLog(@"------------->");
        NSLog(@" ");
        
    }];
    
    NSString *fl = [PingYingHelper firstCharactor:@"重庆"];
    NSLog(@"first = %@", fl);
    
    NSArray  *arr = @[@"CHONGQING", @"BAIDU"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] 'B' AND SELF CONTAINS[cd] 'A'"];
    NSArray *filterdArray  = [arr filteredArrayUsingPredicate:predicate];
    NSLog(@"%@", filterdArray);
    
    
    HomeViewController *rootViewController = [HomeViewController new];
    
    UINavigationController *navigator = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    
    [self.window setRootViewController:navigator];
    
    [self.window makeKeyWindow];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
