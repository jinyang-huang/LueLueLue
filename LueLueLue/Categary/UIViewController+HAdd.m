//
//  UIViewController+HAdd.m
//  JatraTour
//
//  Created by huangjinyang on 17/12/5.
//  Copyright © 2017年 api. All rights reserved.
//

#import "UIViewController+HAdd.h"

@implementation UIViewController (HAdd)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL oriMethod = NSSelectorFromString(@"viewDidLoad");
        SEL bkMethod = NSSelectorFromString(@"bk_viewDidLoad");
        
        Method originalMethod = class_getInstanceMethod(self, oriMethod);
        Method swizzledMethod = class_getInstanceMethod(self, bkMethod);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (void)bk_viewDidLoad {
    [self bk_viewDidLoad];
    
    self.view.backgroundColor = kWhiteColor;
}

@end
