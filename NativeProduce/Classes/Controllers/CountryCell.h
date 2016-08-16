//
//  CountryCell.h
//  NativeProduce
//
//  Created by 朱家权 on 16/8/5.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountryCell : UITableViewCell

- (CountryCell* (^)(NSString *countryName))updateCountryName;
- (CountryCell* (^)(NSString *countryCode))updateCountryCode;

@end
