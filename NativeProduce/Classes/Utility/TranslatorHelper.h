//
//  TranslatorHelper.h
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TranslatorHelper : NSObject

/**
 * @brief JSON转换为模型对象
 * @param NSDictionary JSON
 * @param Class modelClass
 */
+ (id)translateModelFromJSON:(NSDictionary *)JSON withModelClass:(Class)modelClass;

/**
 * @brief JSON转换为模型集合
 * @param NSArray JSON
 * @param Class modelClass
 */
+ (id)translateCollectionFromJSON:(NSArray *)JSON withModelClass:(Class)modelClass;

@end
