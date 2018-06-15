//
//  NSData+HAdd.h
//  SpotMe
//
//  Created by inception on 2018/4/19.
//  Copyright © 2018年 artapranti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (HAdd)


+ (NSData *)reSizeImageData:(UIImage *)sourceImage maxImageSize:(CGFloat)maxImageSize maxSizeWithKB:(CGFloat) maxSize;

@end
