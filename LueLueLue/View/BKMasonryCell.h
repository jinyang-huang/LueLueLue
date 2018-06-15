//
//  BKMasonryCell.h
//  LueLueLue
//
//  Created by inception on 2018/6/15.
//  Copyright © 2018年 hjy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;
@interface BKMasonryCell : UITableViewCell

@property(nonatomic,strong) UILabel *titleLbl;
@property(nonatomic,strong) UILabel *detailLbl;
@property(nonatomic,strong) UILabel *dateLbl;
@property(nonatomic, strong) UIView *tempV;

@property(nonatomic, strong) UIImageView *iv;

@property(nonatomic,assign) CGFloat cellHeight;
@property(nonatomic, strong) UIView *lineV;

@property(nonatomic, strong) Person *model;

@end
