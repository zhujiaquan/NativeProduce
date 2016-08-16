//
//  UINavigationBar+HYBackground.h
//  NativeProduce
//
//  Created by 朱家权 on 16/8/9.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (HYBackground)

/**
 * @brief设置NavigationBar的私有属性backgroundView的背景颜色
 */
- (void)hy_setBackgroundColor:(UIColor *)backgroundColor;

/**
 * @brief 设置NavigationBar的背景透明度
 */
- (void)hy_setElementsAlpha:(CGFloat)alpha;

/**
 * @brief 重设NavigationBar的背景样式为默认的样式
 */
- (void)hy_resetDefaultStyle;

@end
