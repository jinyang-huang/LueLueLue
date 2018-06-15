//
//  UIButton+Hadd.m
//  JatraTour
//
//  Created by huangjinyang on 17/11/26.
//  Copyright © 2017年 api. All rights reserved.
//

#import "UIButton+Hadd.h"
#import <objc/runtime.h>
@implementation UIButton (Hadd)

static char kHandlerBlockKey;

-(void)addtargetForAction:(ButtonAction)block{
    if (!self.block) {
        self.block = block;
    }
    
    [self addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClicked:(UIButton *)sender {
    if (self.block) {
        self.block(self);
    }
}

- (void)setBlock:(ButtonAction)block {
    objc_setAssociatedObject(self, &kHandlerBlockKey, block, OBJC_ASSOCIATION_COPY);
}

-(ButtonAction)block{
    return objc_getAssociatedObject(self, &kHandlerBlockKey);
}

#pragma mark - categaty

- (void)ha_setTitleNormalStatus:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
}

+(instancetype)buildBtnWitnFrame:(CGRect)frame andTitle:(NSString *)title TitleColor:(UIColor *)titleColor andTitleFont:(UIFont *)titleFont andBgColor:(UIColor *)bgColor andCornerRadius:(CGFloat)cornerRadius{
    
    if (!titleColor) {
        titleColor = kBlackColor;
    }
    if (!bgColor) {
        bgColor = kWhiteColor;
    }
    if (!titleFont) {
        titleFont = BKFontR(14);
    }
    
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setBackgroundColor:bgColor];
    btn.titleLabel.font = titleFont;
    if (cornerRadius > 0) {
        btn.layer.cornerRadius = cornerRadius;
        btn.layer.masksToBounds = YES;
    }
    
    return btn;
}


@end
