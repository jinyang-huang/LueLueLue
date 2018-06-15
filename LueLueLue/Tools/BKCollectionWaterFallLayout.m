//
//  BKCollectionWaterFallLayout.m
//  LueLueLue
//
//  Created by inception on 2018/6/14.
//  Copyright © 2018年 hjy. All rights reserved.
//

#import "BKCollectionWaterFallLayout.h"

@interface BKCollectionWaterFallLayout()

/** 所有的cell的attrbts */
@property (nonatomic, strong) NSMutableArray *allAttriArray;

/** 每一列的最后的高度 */
@property (nonatomic, strong) NSMutableArray *currentHeightArr;

- (NSInteger)columns;

- (CGFloat)xMargin;

- (CGFloat)yMarginAtIndexPath:(NSIndexPath *)indexPath;

- (UIEdgeInsets)edgeInsets;

@end



@implementation BKCollectionWaterFallLayout

- (instancetype)initWithDelegate:(id)delegate{
    if (self = [super init]) {
//        if (delegate) {
//            _delegate = delegate;
//        }
        _allAttriArray = [NSMutableArray new];
        _currentHeightArr = [NSMutableArray new];
    }
    return self;
}

- (instancetype)init{
    return [self initWithDelegate:nil];
}

- (void)prepareLayout {
    [super prepareLayout];
    
    [self.currentHeightArr removeAllObjects];
    
    for (int i = 0; i < self.columns; i ++) {
        [self.currentHeightArr addObject:@(self.edgeInsets.top)];
    }
    
    [self.allAttriArray removeAllObjects];
    
    for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i ++) {
        [self.allAttriArray addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]]];
    }
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *atrbs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat w = 1.0 * (self.collectionView.frame.size.width - self.edgeInsets.left - self.edgeInsets.right - self.xMargin * (self.columns - 1))/self.columns;
    w = floor(w);
    
    CGFloat h = [self.delegate flowLayout:self collectionView:self.collectionView heightForIemAtIndexPath:indexPath itemWidth:w];
    
    NSInteger minColumnIndex = 0;
    CGFloat minColumnHeight = [self.currentHeightArr[minColumnIndex] floatValue];
    for (NSInteger i = 1; i < self.currentHeightArr.count; i ++) {
        CGFloat curH = [self.currentHeightArr[i] floatValue];
        if (minColumnHeight > curH) {
            minColumnIndex = i;
            minColumnHeight = curH;
        }
    }
    
    CGFloat x = self.edgeInsets.left + (self.xMargin + w) * minColumnIndex;
    CGFloat y = minColumnHeight + [self yMarginAtIndexPath:indexPath];
    
    if (minColumnHeight == self.edgeInsets.top) {
        y = self.edgeInsets.top;
    }
    
    atrbs.frame = CGRectMake(x, y, w, h);
    self.currentHeightArr[minColumnIndex] = @(CGRectGetMaxY(atrbs.frame));
    
    return atrbs;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.allAttriArray;
}

- (CGSize)collectionViewContentSize{
    __block CGFloat maxColH = 0;
    [self.currentHeightArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber *numHeight = obj;
        if (maxColH < [numHeight floatValue]) {
            maxColH = [numHeight floatValue];
        }
    }];
    
    return CGSizeMake(self.collectionView.frame.size.width, maxColH + self.edgeInsets.bottom);
}


- (NSInteger)columns{
    if (self.delegate && [self.delegate respondsToSelector:@selector(flowLayout:columnsInCollectionView:)]) {
        return [self.delegate flowLayout:self columnsInCollectionView:self.collectionView];
    }
    else{
        return 3;
    }
}

- (id<BKFlowLayoutDelegate>)delegate{
    return (id<BKFlowLayoutDelegate>)self.collectionView.dataSource;
}

- (CGFloat)xMargin{
    if (self.delegate && [self.delegate respondsToSelector:@selector(waterflowLayout:columnsMarginInCollectionView:)]) {
        return [self.delegate waterflowLayout:self columnsMarginInCollectionView:self.collectionView];
    }
    else{
        return 10;
    }
}

- (CGFloat)yMarginAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self respondsToSelector:@selector(waterflowLayout:collectionView:linesMarginForItemAtIndexPath:)]) {
        return [self.delegate waterflowLayout:self collectionView:self.collectionView linesMarginForItemAtIndexPath:indexPath];
    }
    else{
        return 10;
    }
}

- (UIEdgeInsets)edgeInsets{
    if (self.delegate && [self.delegate respondsToSelector:@selector(waterflowLayout:edgeInsetsInCollectionView:)]) {
        return [self.delegate waterflowLayout:self edgeInsetsInCollectionView:self.collectionView];
    }
    else{
        return UIEdgeInsetsMake(0, 10, 0, 10);
    }
}





@end
