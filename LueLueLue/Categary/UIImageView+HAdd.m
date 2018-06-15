//
//  UIImageView+HAdd.m
//  JatraTour
//
//  Created by huangjinyang on 17/12/29.
//  Copyright © 2017年 api. All rights reserved.
//

#import "UIImageView+HAdd.h"

@implementation UIImageView (HAdd)

- (void)ha_calculateWidth {
    UIImage *image = self.image;
    
    self.width = self.height * (image.size.width / image.size.height);
}

- (void)ha_calculateHeight {
    UIImage *image = self.image;
    
    self.height = self.width * (image.size.height / image.size.width);
}

@end
