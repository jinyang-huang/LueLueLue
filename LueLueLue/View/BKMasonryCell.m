//
//  BKMasonryCell.m
//  LueLueLue
//
//  Created by inception on 2018/6/15.
//  Copyright © 2018年 hjy. All rights reserved.
//

#import "BKMasonryCell.h"
#import "Person.h"

@implementation BKMasonryCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.titleLbl = [UILabel buildLabelWithFrame:CGRectZero content:@"" textColor:kBlackColor font:BKFontB(15) textAlignment:0 lines:0];
    self.detailLbl = [UILabel buildLabelWithFrame:CGRectZero content:@"" textColor:kBlackColor font:BKFontR(15) textAlignment:0 lines:0];
    self.dateLbl = [UILabel buildLabelWithFrame:CGRectZero content:@"" textColor:klGrayColor font:BKFontR(13) textAlignment:2 lines:0];
    self.tempV = [[UIView alloc] initWithFrame:CGRectZero];
    self.tempV.backgroundColor = [UIColor randomColor];
    
    kCellAddView(self.titleLbl)
    kCellAddView(self.detailLbl)
    kCellAddView(self.dateLbl)
    kCellAddView(self.tempV)
    
    self.iv = [[UIImageView alloc] init];
    kCellAddView(self.iv)
    
}

- (void)setModel:(Person *)model {
    
    self.titleLbl.text = model.name;
    self.detailLbl.text = model.detail;
    self.dateLbl.text = model.dateStr;
    for (id i in self.contentView.constraints) {
        [self.contentView removeConstraint:i];
    }
//    if (self.titleLbl.text.length%2 - 1 == 0) {
//        [self.tempV mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.titleLbl.mas_bottom).offset(5);
//            make.left.mas_equalTo(self.titleLbl);
//            make.width.mas_equalTo(self.titleLbl);
//            make.height.mas_equalTo(50);
//        }];
//        self.tempV.hidden = NO;
//    }
//    else{
//        [self.tempV mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.titleLbl.mas_bottom).offset(5);
//            make.left.mas_equalTo(self.titleLbl);
//            make.width.mas_equalTo(self.titleLbl);
//            make.height.mas_equalTo(1);
//        }];
//        self.tempV.hidden = YES;
//    }
//
    
    
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(5);
        make.width.mas_equalTo(kWidth - 20);
    }];
    [self.detailLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLbl);
        make.width.mas_equalTo(self.titleLbl);
        make.top.mas_equalTo(self.titleLbl.mas_bottom).offset(5);
    }];
    [self.iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(80);
        make.width.mas_equalTo(40);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(self.detailLbl.mas_bottom);
    }];
    self.iv.image = [UIImage imageNamed:@"image1"];
    [self.dateLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(5);
        make.top.equalTo(self.iv.mas_bottom).offset(5);
    }];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
