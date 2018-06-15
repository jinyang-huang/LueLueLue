//
//  UIAlertController+HAdd.m
//  JatraTour
//
//  Created by huangjinyang on 17/12/20.
//  Copyright © 2017年 api. All rights reserved.
//

#import "UIAlertController+HAdd.h"

@implementation UIAlertController (HAdd)


+ (instancetype)HAddAlertWithTitle:(NSString *)title message:(NSString *)message actionTitles:(NSArray *)actionTitles  preferredStyle:(UIAlertControllerStyle)preferredStyle handler:(void(^)(NSUInteger buttonIndex, NSString *buttonTitle))handler cancelClick:(void(^)(void)) cancelHandler{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:L(@"Cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelHandler) {
            cancelHandler();
        }
    }];
    [alert addAction:cancelAction];
    
    for (int i = 0; i < actionTitles.count; i ++) {
        
        UIAlertAction *confimAction = [UIAlertAction actionWithTitle:actionTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            handler(i, actionTitles[i]);
        }];
        [alert addAction:confimAction];
    }
    return alert;
}

+ (instancetype)HAddAlertNoAlertWithTitle:(NSString *)title message:(NSString *)message actionTitles:(NSArray *)actionTitles  preferredStyle:(UIAlertControllerStyle)preferredStyle handler:(void(^)(NSUInteger buttonIndex, NSString *buttonTitle))handler cancelClick:(void(^)(void)) cancelHandler{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    for (int i = 0; i < actionTitles.count; i ++) {
        
        UIAlertAction *confimAction = [UIAlertAction actionWithTitle:actionTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            handler(i, actionTitles[i]);
        }];
        [alert addAction:confimAction];
    }
    return alert;
}
@end
