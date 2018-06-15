//
//  UIColor+HAdd.h
//  JatraTour
//
//  Created by huangjinyang on 17/11/11.
//  Copyright © 2017年 api. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HAdd)
/**
 *  16进制颜色
 *
 *  @param hexColorString 16进制值
 *
 *  @return 16进制对应颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)hexColorString;

+ (UIColor*)randomColor;

+ (UIColor *)lineColor;


@end
