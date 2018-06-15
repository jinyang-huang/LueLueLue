//
//  UIView+HAdd.h
//  JatraTour
//
//  Created by huangjinyang on 17/11/11.
//  Copyright © 2017年 api. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kShowMB [MBProgressHUD showHUDAddedTo:self.view animated:YES];
#define kHideMB [MBProgressHUD hideHUDForView:self.view animated:YES];

#define kWKShowMB [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
#define kWKHideMB [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];


typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);
@interface UIView (HAdd)

@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.

/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)addTapActionWithBlock:(GestureActionBlock)block;

- (void)addTapActionNeedClickTime:(NSInteger)tapTime WithBlock:(GestureActionBlock)block;

- (void)addPanTapActionWithBlock:(GestureActionBlock)block;
- (void)showTips:(NSString *)text;
- (void)showTips:(NSString *)text durationSeconds:(CGFloat)durationTime;
@end
