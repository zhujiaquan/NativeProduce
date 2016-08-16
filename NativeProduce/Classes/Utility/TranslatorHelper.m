//
//  TranslatorHelper.m
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "TranslatorHelper.h"
#import <Mantle/Mantle.h>

@implementation TranslatorHelper

+ (id)translateModelFromJSON:(NSDictionary *)JSON withModelClass:(Class)modelClass
{
    NSValueTransformer *valueTransformer = [MTLValueTransformer mtl_JSONDictionaryTransformerWithModelClass:modelClass];
    NSArray *model = [valueTransformer transformedValue:JSON];
    return model;
}

+ (id)translateCollectionFromJSON:(NSArray *)JSON withModelClass:(Class)modelClass
{
    NSValueTransformer *valueTransformer = [MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:modelClass];
    NSArray *collection = [valueTransformer transformedValue:JSON];
    return collection;
}

@end
