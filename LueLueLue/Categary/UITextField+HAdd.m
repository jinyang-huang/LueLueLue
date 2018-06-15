//
//  UITextField+HAdd.m
//  SpotMe
//
//  Created by huangjinyang on 17/12/17.
//  Copyright © 2017年 artapranti. All rights reserved.
//

#import "UITextField+HAdd.h"

@interface UITextField ()<UITextFieldDelegate>

@end


@implementation UITextField (HAdd)
static char kHandlerBlockKey;
static char kHandlerMaxNumberKey;
static char kHandlerEditEnableKey;
- (void)addEditValueChangeBlock:(TFAction)block {
    if (!self.block) {
        self.block = block;
    }
    
    [self addTarget:self action:@selector(tfChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)tfChanged:(UITextField *)tf {
    if (self.block) {
        if (self.ha_maxNumber.integerValue > 0 && tf.text.length > self.ha_maxNumber.integerValue) {
            tf.text = [tf.text substringToIndex:self.ha_maxNumber.integerValue];
        }
        self.block(tf);
    }
}

- (void)setBlock:(TFAction)block {
    objc_setAssociatedObject(self, &kHandlerBlockKey, block, OBJC_ASSOCIATION_COPY);
}

-(TFAction)block{
    return objc_getAssociatedObject(self, &kHandlerBlockKey);
}

- (void)setHa_maxNumber:(NSNumber *)ha_maxNumber {
    objc_setAssociatedObject(self, &kHandlerMaxNumberKey, ha_maxNumber, OBJC_ASSOCIATION_COPY);
}

- (NSNumber *)ha_maxNumber{
    return objc_getAssociatedObject(self, &kHandlerMaxNumberKey);
}

#pragma mark - edit enable
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return !self.forbiddenEdit;
}

- (void)setForbiddenEdit:(BOOL)forbiddenEdit {
    self.delegate = self;
    objc_setAssociatedObject(self, &kHandlerEditEnableKey, @(forbiddenEdit), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)forbiddenEdit{
    return objc_getAssociatedObject(self, &kHandlerEditEnableKey);
}

@end
