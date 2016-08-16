//
//  UINavigationBar+HYBackground.m
//  NativeProduce
//
//  Created by 朱家权 on 16/8/9.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "UINavigationBar+HYBackground.h"
#import <objc/runtime.h>

@implementation UINavigationBar (HYBackground)

#pragma mark - runtime动态添加UIImage属性
static char navigationBar_BackgroundImage;

// getter
- (UIImage *)navigationBarBackgroundImage
{
    return objc_getAssociatedObject(self, &navigationBar_BackgroundImage);
}

// setter
- (void)setNavigationBarBackgroundImage:(UIImage *)navigationBarBackgroundImage
{
    objc_setAssociatedObject(self,
                             &navigationBar_BackgroundImage,
                             navigationBarBackgroundImage,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/*
 1、设置背景的颜色
 2、设置背景的透明度
 3、恢复UINavigationBar背景的默认样式
 */
#pragma mark - 公开的API方法
- (void)hy_setBackgroundColor:(UIColor *)backgroundColor
{
    // 为了提高性能，我不想每次设置颜色，都需要进行创建UIImage对象，然后重新赋值
    if (!self.navigationBarBackgroundImage) {
        self.barStyle = UIBarStyleBlackOpaque;
        [self hy_setBackgroundViewSubViewAlpha:0];
        self.navigationBarBackgroundImage = [UIImage new];
        [self setBackgroundImage:self.navigationBarBackgroundImage
                   forBarMetrics:UIBarMetricsDefault];
    }
    // 通过KVC拿到这个属性，然后对其进行直接赋值
    UIView *backgroundViewObject = [self valueForKey:@"backgroundView"];
    // 设置其CALayer属性的颜色值，因为CALayer是通过GPU渲染的，所以性能高一些，又不影响CPU
    backgroundViewObject.layer.backgroundColor = backgroundColor.CGColor;
    
}

- (void)hy_setElementsAlpha:(CGFloat)alpha
{
    // 为了提高性能，我不想每次设置颜色，都需要进行创建UIImage对象，然后重新赋值
    if (!self.navigationBarBackgroundImage) {
        self.navigationBarBackgroundImage = [UIImage new];
        [self setBackgroundImage:self.navigationBarBackgroundImage
                   forBarMetrics:UIBarMetricsDefault];
    }
    // 通过KVC拿到这个属性，然后对其进行直接赋值
    UIView *backgroundViewObject = [self valueForKey:@"backgroundView"];
    // 设置其CALayer属性的颜色值，因为CALayer是通过GPU渲染的，所以性能高一些，又不影响CPU
    backgroundViewObject.alpha = alpha;
}

- (void)hy_resetDefaultStyle
{
    if (self.navigationBarBackgroundImage) {
        self.navigationBarBackgroundImage = nil;
        [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    }
    [self hy_setBackgroundViewSubViewAlpha:1];
    self.barStyle = UIBarStyleDefault;
}

#pragma mark - 设置BackgroundViewSubView透明度方法

- (void)hy_setBackgroundViewSubViewAlpha:(CGFloat)alpha
{
    // 通过KVC拿到这个属性，然后对其子控件进行修改
    UIView *backgroundViewObject = [self valueForKey:@"backgroundView"];
    for (UIView* childView in backgroundViewObject.subviews) {
        childView.alpha = alpha;
    }
}

@end
