//
//  UIAlertController+HAdd.h
//  JatraTour
//
//  Created by huangjinyang on 17/12/20.
//  Copyright © 2017年 api. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (HAdd)


+ (instancetype)HAddAlertWithTitle:(NSString *)title message:(NSString *)message actionTitles:(NSArray *)actionTitles  preferredStyle:(UIAlertControllerStyle)preferredStyle handler:(void(^)(NSUInteger buttonIndex, NSString *buttonTitle))handler cancelClick:(void(^)(void)) cancelHandler;

+ (instancetype)HAddAlertNoAlertWithTitle:(NSString *)title message:(NSString *)message actionTitles:(NSArray *)actionTitles  preferredStyle:(UIAlertControllerStyle)preferredStyle handler:(void(^)(NSUInteger buttonIndex, NSString *buttonTitle))handler cancelClick:(void(^)(void)) cancelHandler;
@end
