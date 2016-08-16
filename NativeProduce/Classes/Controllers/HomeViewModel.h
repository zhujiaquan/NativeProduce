//
//  HomeViewModel.h
//  NativeProduce
//
//  Created by 朱家权 on 16/8/4.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HomeViewModelPresenter;

typedef void (^Callback) (NSError *error);

/**
 * MVVM 模式
 * http://www.cnblogs.com/brycezhang/p/3840567.html
 * PS: view model是一个放置用户输入验证逻辑，视图显示逻辑，发起网络请求和其他各种各样的代码的极好的地方。
 *     有一件事情不应归入view model，那就是任何视图本身的引用。view model的概念同时适用于于iOS和OS X。（
 *     换句话说，不要在view model中使用 #import UIKit.h）
 */
@interface HomeViewModel : NSObject

@property (nonatomic, weak) id<HomeViewModelPresenter> presenter;

- (NSUInteger)countryCount;

- (NSUInteger (^)())countryArrayCount;

- (NSString* (^)(NSInteger index))countryName;
- (NSString* (^)(NSInteger index))countryCode;

- (NSString *)countryNameForCountryAtIndex:(NSInteger)index;

- (void)fetchedCountries;

@end

@protocol HomeViewModelPresenter

- (void)showAlertWithError:(NSError *)error;
- (void)showAlertWithMessage:(NSString *)message;
- (void)reloadData;

@end
