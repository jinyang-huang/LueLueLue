//
//  BKVerticalWaterFallVC.m
//  LueLueLue
//
//  Created by inception on 2018/6/14.
//  Copyright © 2018年 hjy. All rights reserved.
//

#import "BKVerticalWaterFallVC.h"
#import "BKCollectionWaterFallLayout.h"
@interface BKVerticalWaterFallVC ()<UICollectionViewDelegate, UICollectionViewDataSource,BKFlowLayoutDelegate>

@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation BKVerticalWaterFallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view.
}

#pragma mark - UI

- (void)createUI {
    self.navigationItem.title = @"1";
    self.view.backgroundColor = kWhiteColor;
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
}

#pragma mark - collection delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor yellowColor];
    
    if (![cell.contentView viewWithTag:100]) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        label.tag = 100;
        label.textColor = [UIColor redColor];
        label.font = [UIFont boldSystemFontOfSize:17];
        [cell.contentView addSubview:label];
    }
    
    UILabel *label = [cell.contentView viewWithTag:100];
    
    label.text = [NSString stringWithFormat:@"%zd", indexPath.item];
    
    return cell;
}

#pragma mark - layout delegate

- (UIEdgeInsets)waterflowLayout:(BKCollectionWaterFallLayout *)layout edgeInsetsInCollectionView:(UICollectionView *)collectionView{
    return UIEdgeInsetsMake(10, 5, 10, 5);
}

- (CGFloat)flowLayout:(BKCollectionWaterFallLayout *)layout collectionView:(UICollectionView *)collectionView heightForIemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth{
    return (arc4random()%5 + 1) * itemWidth;
}

- (CGFloat)waterflowLayout:(BKCollectionWaterFallLayout *)layout columnsMarginInCollectionView:(UICollectionView *)collectionView{
    return 10;
}

- (CGFloat)waterflowLayout:(BKCollectionWaterFallLayout *)layout collectionView:(UICollectionView *)collectionView linesMarginForItemAtIndexPath:(NSIndexPath *)indexPath{
    return 5;
}

- (NSInteger)flowLayout:(BKCollectionWaterFallLayout *)layout columnsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}


#pragma mark - private method


#pragma mark - getter

- (NSMutableArray *)dataArr{
    return _dataArr;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[[BKCollectionWaterFallLayout alloc] init]];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
    }
    return _collectionView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
