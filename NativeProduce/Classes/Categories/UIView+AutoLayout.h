//
//  UIView+AutoLayout.h
//  NativeProduce
//
//  Created by 朱家权 on 16/8/1.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AutoLayout <NSObject>

- (void)addConstraints;

@end

@interface UIView (AutoLayout)

// height
- (NSLayoutConstraint *)constraintHeight:(CGFloat)height;
- (NSLayoutConstraint *)constraintHeightEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualHeight:(CGFloat)height;

// width
- (NSLayoutConstraint *)constraintWidth:(CGFloat)width;
- (NSLayoutConstraint *)constraintWidthEqualToView:(UIView *)view;

// center
- (NSLayoutConstraint *)constraintCenterXEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintCenterYEqualToView:(UIView *)view;

// top, bottom, left, right
- (NSArray *)constraintsTop:(CGFloat)top FromView:(UIView *)view;
- (NSArray *)constraintsBottom:(CGFloat)bottom FromView:(UIView *)view;
- (NSArray *)constraintsLeft:(CGFloat)left FromView:(UIView *)view;
- (NSArray *)constraintsRight:(CGFloat)right FromView:(UIView *)view;

- (NSArray *)constraintsTopInContainer:(CGFloat)top;
- (NSArray *)constraintsBottomInContainer:(CGFloat)bottom;
- (NSArray *)constraintsLeftInContainer:(CGFloat)left;
- (NSArray *)constraintsRightInContainer:(CGFloat)right;

- (NSLayoutConstraint *)constraintTopEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintTopEqualToView:(UIView *)view distance:(CGFloat)distance;

- (NSLayoutConstraint *)constraintBottomEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintBottomEqualToView:(UIView *)view distance:(CGFloat)distance;

- (NSLayoutConstraint *)constraintLeftEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintLeftEqualToView:(UIView *)view distance:(CGFloat)distance;

- (NSLayoutConstraint *)constraintRightEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintRightEqualToView:(UIView *)view distance:(CGFloat)distance;

// size
- (NSArray *)constraintsSize:(CGSize)size;
- (NSArray *)constraintsSizeEqualToView:(UIView *)view;

// imbue
- (NSArray *)constraintsFillWidth;
- (NSArray *)constraintsFillHeight;
- (NSArray *)constraintsFill;

// assign
- (NSArray *)constraintsAssignLeft;
- (NSArray *)constraintsAssignRight;
- (NSArray *)constraintsAssignTop;
- (NSArray *)constraintsAssignBottom;

// remove
- (void)removeAllConstraints;

@end
