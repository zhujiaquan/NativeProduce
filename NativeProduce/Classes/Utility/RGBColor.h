//
//  RGBColor.h
//  NativeProduce
//
//  Created by 朱家权 on 16/8/1.
//  Copyright © 2016年 inkey. All rights reserved.
//

#ifndef RGB_H_
#define RGB_H_

#import <UIKit/UIKit.h>

#pragma mark - RGB

static inline UIColor* RGB(CGFloat r, CGFloat g, CGFloat b){
    return [UIColor colorWithRed:r/(255.0f)
                           green:g/(255.0f)
                            blue:b/(255.0f)
                           alpha:1.0f];
}

static inline UIColor* RGBA(CGFloat r, CGFloat g, CGFloat b, CGFloat a){
    return [UIColor colorWithRed:r/(255.0f)
                           green:g/(255.0f)
                            blue:b/(255.0f)
                           alpha:a];
}


static inline UIColor* HEXRGB(NSInteger rgbValue){
    return [UIColor
            colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0
            green:((float)((rgbValue & 0xFF00) >> 8))/255.0
            blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
}

static inline UIColor* HEXRGBA(NSInteger rgbValue, CGFloat a){
    return [UIColor
            colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0
            green:((float)((rgbValue & 0xFF00) >> 8))/255.0
            blue:((float)(rgbValue & 0xFF))/255.0 alpha:a];
}

#endif /* RGB_H_ */
