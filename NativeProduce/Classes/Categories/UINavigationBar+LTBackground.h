//
//  UINavigationBar+LTBackground.h
//  NativeProduce
//
//  Created by 朱家权 on 16/8/9.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (LTBackground)

/**
 * @brief设置NavigationBar的私有属性backgroundView的背景颜色
 */
- (void)lt_setBackgroundColor:(UIColor *)backgroundColor;

/**
 * @brief 设置NavigationBar的背景offset
 */
- (void)lt_setTranslationY:(CGFloat)translationY;

/**
 * @brief 设置NavigationBar的背景透明度
 */
- (void)lt_setElementsAlpha:(CGFloat)alpha;

/**
 * @brief 重设NavigationBar的背景样式为默认的样式
 */
- (void)lt_resetDefaultStyle;

@end
