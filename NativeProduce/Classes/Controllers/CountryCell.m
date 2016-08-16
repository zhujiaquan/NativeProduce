//
//  CountryCell.m
//  NativeProduce
//
//  Created by 朱家权 on 16/8/5.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import "CountryCell.h"

@implementation CountryCell

- (CountryCell* (^)(NSString *countryName))updateCountryName {
    
    __weak __typeof(self) weakSelf = self;
    
    CountryCell* (^updateCountryNameBlock)(NSString *countryName) = ^(NSString *countryName){
        
        weakSelf.textLabel.text = countryName;
        
        return weakSelf;
    };
    return updateCountryNameBlock;
}

- (CountryCell* (^)(NSString *countryCode))updateCountryCode {
    
    __weak __typeof(self) weakSelf = self;
    
    CountryCell* (^updateCountryCodeBlock)(NSString *countryCode) = ^(NSString *countryCode){
        
        NSLog(@"[DEBUG] countryCode = %@", countryCode);
        
        return weakSelf;
    };
    return updateCountryCodeBlock;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
