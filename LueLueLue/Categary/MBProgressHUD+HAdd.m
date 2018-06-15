//
//  MBProgressHUD+HAdd.m
//  JatraTour
//
//  Created by huangjinyang on 17/11/11.
//  Copyright © 2017年 api. All rights reserved.
//

#import "MBProgressHUD+HAdd.h"

@implementation MBProgressHUD (HAdd)

+(void)showMessage:(NSString *)text inView :(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // Set the text mode to show only text.
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    // Move to bottm center.
    
    hud.offset = CGPointMake(0.f, view.height*2/3);
    hud.bezelView.backgroundColor=ThemeColor;
    [hud hideAnimated:YES afterDelay:1.5];
}
@end
