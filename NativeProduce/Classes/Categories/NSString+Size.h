//
//  NSString+Size.h
//  NativeProduce
//
//  Created by 朱家权 on 16/8/1.
//  Copyright © 2016年 inkey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)

- (CGSize)textSizeWithFont:(UIFont *)font;
- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end
