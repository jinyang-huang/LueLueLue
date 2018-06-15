//
//  BKHeader.h
//  LueLueLue
//
//  Created by inception on 2018/6/14.
//  Copyright © 2018年 hjy. All rights reserved.
//

#ifndef BKHeader_h
#define BKHeader_h

//categary
#import "UIColor+HAdd.h"
#import "UIImage+HAdd.h"
#import "UIView+HAdd.h"
#import "NSString+HAdd.h"
#import "MBProgressHUD+HAdd.h"
#import "UILabel+HAdd.h"
#import "NSDate+HAdd.h"
#import "UIButton+Hadd.h"
#import "UIViewController+HAdd.h"
#import "UITextField+HAdd.h"
#import "UIImageView+HAdd.h"
#import "UIAlertController+HAdd.h"
#import "NSData+HAdd.h"

//vendor
#import "Masonry.h"
#import <YYText/YYText.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <YYModel/YYModel.h>

//define
#define kHeight      [[UIScreen mainScreen] bounds].size.height
#define kWidth       [[UIScreen mainScreen] bounds].size.width

#define isIphone4 kHeight == 480
#define isIphone5 kHeight == 568
#define isIphone6 kHeight == 667
#define isIphone6p kHeight == 736
#define k_isIphoneX kHeight == 812

#define iPhone5OrLow kHeight <= 568


#define kCellAddView(x) [self.contentView addSubview:(x)];
#define kAddView(x) [self addSubview:(x)];

#define kNavH (k_isIphoneX? 88 : 64)
#define kTop (k_isIphoneX? 22 : 0)
#define kTabBarH (k_isIphoneX? 49 + 34 : 49)
#define kBottom (k_isIphoneX? 34 : 0)


#define ThemeColor [UIColor colorWithHexString:@"60B5E0"]


#define kBlackColor [UIColor blackColor]
#define kWhiteColor [UIColor whiteColor]
#define klGrayColor [UIColor lightGrayColor]
#define kGrayBgColor [UIColor colorWithHexString:@"efefef"]
#define kLineColor [UIColor lineColor]


#define BKFontR(x) [UIFont systemFontOfSize:(x)]
#define BKFontB(x) [UIFont boldSystemFontOfSize:(x)]





//国际化字符串
#undef L
#define L(str) NSLocalizedString(str, nil)










#endif /* BKHeader_h */
