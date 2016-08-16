//
//  NetiveProduceApi+CountriesFetcher.m
//  NativeProduce
//
//  Created by 朱家权 on 16/7/28.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "NetiveProduceApi+CountriesFetcher.h"
#import "TranslatorHelper.h"
#import "Country.h"

@implementation NetiveProduceApi (CountriesFetcher)

#pragma mark - Public methods

- (void)GetCountriesWithSuccess:(void (^)(NSArray *array))success failure:(void (^)(NSError *error))failure {
    NSDictionary *parameters = @{@"username": @"WeatherApp"};
    [self.netiveProduceApiJSONRequest GET:@"countryInfoJSON" parameters:parameters success:^(id responseObject) {
        
        // NSLog(@"[DEBUG] %@", responseObject);
        
        NSArray *collection = [TranslatorHelper translateCollectionFromJSON:[responseObject objectForKey:@"geonames"]
                                                             withModelClass:[Country class]];
        success(collection);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
