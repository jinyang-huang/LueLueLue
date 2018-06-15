//
//  UILabel+HAdd.h
//  JatraTour
//
//  Created by huangjinyang on 17/11/11.
//  Copyright © 2017年 api. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol YBAttributeTapActionDelegate <NSObject>
@optional
/**
 *  YBAttributeTapActionDelegate
 *
 *  @param string  点击的字符串
 *  @param range   点击的字符串range
 *  @param index 点击的字符在数组中的index
 */
- (void)yb_attributeTapReturnString:(NSString *)string
                              range:(NSRange)range
                              index:(NSInteger)index;
@end

@interface YBAttributeModel : NSObject

@property (nonatomic, copy) NSString *str;

@property (nonatomic, assign) NSRange range;

@end


@interface UILabel (HAdd)

/**
 *  创建Label 默认左对齐 不换行 系统字号
 *
 *  @param frame frame
 *  @param color  背景色 默认 透明
 *  @param text   内容
 *  @param tColor 内容颜色 默认 黑色
 *
 *  @return label
 */
+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor;

/**
 *  创建Label 默认左对齐 不换行
 *
 *  @param frame  frame
 *  @param color  背景色 默认 透明
 *  @param text   内容
 *  @param tColor 内容颜色 默认 黑色
 *  @param font   字号 默认 15
 *
 *  @return Label
 */
+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font;

/**
 *  创建Label 默认不换行
 *
 *  @param frame     frame
 *  @param color     背景色 默认 透明
 *  @param text      内容
 *  @param tColor    内容颜色 默认 黑色
 *  @param font      字号  默认 15
 *  @param alignment 对齐方式  默认 左对齐
 *
 *  @return Label
 */
+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font textAlignment:(NSTextAlignment)alignment;

/**
 *  创建Label
 *
 *  @param frame     frame
 *  @param color     背景色 默认 透明
 *  @param text      内容
 *  @param tColor    内容颜色 默认 黑色
 *  @param font      字号 默认 15
 *  @param alignment 对齐方式 默认 左对齐
 *  @param line      显示行数 默认 无限制
 *
 *  @return Label
 */
+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(id )font textAlignment:(NSTextAlignment)alignment lines:(NSInteger)line;

+ (UILabel *)buildLabelWithFrame:(CGRect)frame content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font textAlignment:(NSTextAlignment)alignment lines:(NSInteger)line;


- (CGFloat)heightWithCurrentWidth:(CGFloat)curWidth;
- (CGFloat)widthWithCurrentHeight:(CGFloat)curHeight;

- (void)ha_calculateHeight;

- (void)ha_calculateWidthSingleLine;
- (void)ha_attriCalculateHeight;
- (void)ha_attriCalculateWidth;

#pragma mark - ybAttributeText

/**
 *  是否打开点击效果，默认是打开
 */
@property (nonatomic, assign) BOOL enabledTapEffect;

/**
 *  给文本添加点击事件Block回调
 *
 *  @param strings  需要添加的字符串数组
 *  @param tapClick 点击事件回调
 */
- (void)yb_addAttributeTapActionWithStrings:(NSArray <NSString *> *)strings
                                 tapClicked:(void (^) (NSString *string , NSRange range , NSInteger index))tapClick;

/**
 *  给文本添加点击事件delegate回调
 *
 *  @param strings  需要添加的字符串数组
 *  @param delegate delegate
 */
- (void)yb_addAttributeTapActionWithStrings:(NSArray <NSString *> *)strings
                                   delegate:(id <YBAttributeTapActionDelegate> )delegate;

@end
