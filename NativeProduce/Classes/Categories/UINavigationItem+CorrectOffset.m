//
//  UINavigationItem+CorrectOffset.m
//  NativeProduce
//
//  Created by 朱家权 on 16/8/1.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "UINavigationItem+CorrectOffset.h"

@implementation UINavigationItem (CorrectOffset)

- (void)addLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        // Add a spacer on when running lower than iOS 7.0
        UIBarButtonItem *negativeSpacer =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                      target:nil
                                                      action:nil];
        negativeSpacer.width = -10.0f;
        [self setLeftBarButtonItems:[NSArray arrayWithObjects:negativeSpacer, leftBarButtonItem, nil]];
    }
    else {
        // Just set the UIBarButtonItem as you would normally
        [self setLeftBarButtonItem:leftBarButtonItem];
    }
}

- (void)addRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        // Add a spacer on when running lower than iOS 7.0
        UIBarButtonItem *negativeSpacer =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                      target:nil
                                                      action:nil];
        negativeSpacer.width = -10.0f;
        [self setRightBarButtonItems:[NSArray arrayWithObjects:negativeSpacer, rightBarButtonItem, nil]];
    }
    else {
        // Just set the UIBarButtonItem as you would normally
        [self setRightBarButtonItem:rightBarButtonItem];
    }
}

@end
