//
//  UINavigationBar+LTBackground.m
//  NativeProduce
//
//  Created by 朱家权 on 16/8/9.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "UINavigationBar+LTBackground.h"
#import <objc/runtime.h>

@implementation UINavigationBar (LTBackground)

#pragma mark - runtime动态添加UIView属性
static char navigationBar_overlayKey;

// getter
- (UIView *)overlay
{
    return objc_getAssociatedObject(self, &navigationBar_overlayKey);
}

// setter
- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self,
                             &navigationBar_overlayKey,
                             overlay,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)lt_setBackgroundColor:(UIColor *)backgroundColor
{
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.overlay atIndex:0];
    }
    
    // 设置其CALayer属性的颜色值，因为CALayer是通过GPU渲染的，所以性能高一些，又不影响CPU
    self.overlay.layer.backgroundColor = backgroundColor.CGColor;
}

- (void)lt_setTranslationY:(CGFloat)translationY
{
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (void)lt_setElementsAlpha:(CGFloat)alpha
{
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
    // when viewController first load, the titleView maybe nil
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            obj.alpha = alpha;
            *stop = YES;
        }
    }];
}

- (void)lt_resetDefaultStyle
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.overlay removeFromSuperview];
    self.overlay = nil;
}

@end
