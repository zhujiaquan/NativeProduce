//
//  HomeViewModel.m
//  NativeProduce
//
//  Created by 朱家权 on 16/8/4.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "HomeViewModel.h"
#import "NetiveProduceApi+CountriesFetcher.h"
#import "Country.h"

@interface HomeViewModel ()

@property (copy, nonatomic) NSMutableArray *countries;

@end

@implementation HomeViewModel

- (NSMutableArray *)countries {
    if (!_countries) {
        _countries = [NSMutableArray array];
    }
    return _countries;
}

- (NSMutableArray *)countriesArray {
    return [self mutableArrayValueForKey:NSStringFromSelector(@selector(countries))];
}

- (NSUInteger)countryCount {
    return [self.countries count];
}

- (void)removeAllCountries {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, [self countryCount])];
    [[self countriesArray] removeObjectsAtIndexes:indexSet];
}

- (void)addCountries:(NSArray *)countries {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange([self countryCount], [countries count])];
    [[self countriesArray] insertObjects:countries atIndexes:indexSet];
}

- (NSUInteger (^)())countryArrayCount {
    
    __weak __typeof(self) weakSelf = self;
    
    NSUInteger (^countBlock)() = ^(){
        
        return [weakSelf countryCount];
    };
    return countBlock;
}

- (NSString* (^)(NSInteger index))countryName {
    
    __weak __typeof(self) weakSelf = self;
    
    NSString *(^countryNameBlock)(NSInteger index) = ^(NSInteger index){
        
        Country *country = [[weakSelf countriesArray] objectAtIndex:index];
        return country.countryName;
    };
    return countryNameBlock;
}

- (NSString* (^)(NSInteger index))countryCode {
    
    __weak __typeof(self) weakSelf = self;
    
    NSString *(^countryCodeBlock)(NSInteger index) = ^(NSInteger index){
        
        Country *country = [[weakSelf countriesArray] objectAtIndex:index];
        return country.countryCode;
    };
    return countryCodeBlock;
}

- (NSString *)countryNameForCountryAtIndex:(NSInteger)index {
    
    if (![self countriesArray]) return nil;
    
    Country *country = [[self countriesArray] objectAtIndex:index];
    
    return country.countryName;
}

- (void)fetchedCountries {
    
    __weak typeof(self) weakSelf = self;
    
    [[NetiveProduceApi sharedInstance] GetCountriesWithSuccess:^(NSArray *array) {
        
        NSLog(@"[DEBUG] Get countries success.");
        
        if (!weakSelf) return;
        
        [weakSelf removeAllCountries];
        [weakSelf addCountries:array];
        
        [weakSelf.presenter reloadData];
        [weakSelf.presenter showAlertWithMessage:@"Get countries success."];
        
    } failure:^(NSError *error) {
        
        NSLog(@"[DEBUG] Get countries failed! [%@]", [error localizedDescription]);
        [weakSelf.presenter showAlertWithError:error];
        
    }];
}

@end
