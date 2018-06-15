//
//  BKCollectionWaterFallLayout.h
//  LueLueLue
//
//  Created by inception on 2018/6/14.
//  Copyright © 2018年 hjy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BKCollectionWaterFallLayout;

@protocol BKFlowLayoutDelegate <NSObject>

@required


/**
 代理返回item的高度

 @param layout 布局
 @param collectionView collectionView
 @param indexPath indexPath
 @param itemWidth 内部宽度
 @return cell高度
 */
- (CGFloat)flowLayout:(BKCollectionWaterFallLayout *)layout collectionView:(UICollectionView *)collectionView heightForIemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth;

@optional


/**
 列数

 @param layout 布局
 @param collectionView collectionView
 @return 列数
 */
- (NSInteger)flowLayout:(BKCollectionWaterFallLayout *)layout columnsInCollectionView:(UICollectionView *)collectionView;

/**
 列间距

 @param layout 布局
 @param collectionView collectionView
 @return 列间距
 */
- (CGFloat)waterflowLayout:(BKCollectionWaterFallLayout *)layout columnsMarginInCollectionView:(UICollectionView *)collectionView;

/**
 行间距

 @param layout 布局
 @param collectionView collectionView
 @param indexPath indexPath
 @return 行间距
 */
- (CGFloat)waterflowLayout:(BKCollectionWaterFallLayout *)layout collectionView:(UICollectionView *)collectionView linesMarginForItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 section的内边距

 @param layout 布局
 @param collectionView collectionView
 @return section的内边距
 */
- (UIEdgeInsets)waterflowLayout:(BKCollectionWaterFallLayout *)layout edgeInsetsInCollectionView:(UICollectionView *)collectionView;

@end



@interface BKCollectionWaterFallLayout : UICollectionViewLayout

@property(nonatomic, weak) id<BKFlowLayoutDelegate> delegate;
- (instancetype)initWithDelegate:(id<BKFlowLayoutDelegate>)delegate;

@end
