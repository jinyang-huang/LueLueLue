//
//  BKPhotoVC.m
//  LueLueLue
//
//  Created by inception on 2018/6/20.
//  Copyright © 2018年 hjy. All rights reserved.
//

#import "BKPhotoVC.h"
#import <ZLPhotoBrowser/ZLPhotoActionSheet.h>

@interface BKPhotoVC ()

@property(nonatomic, strong) UIImageView *iv;
@end

@implementation BKPhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, kNavH, kWidth/2, kHeight/2)];
    [self.view addSubview:self.iv];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ZLPhotoActionSheet *actionSheet = [[ZLPhotoActionSheet alloc] init];
    actionSheet.selectImageBlock = ^(NSArray<UIImage *> * _Nullable images, NSArray<PHAsset *> * _Nonnull assets, BOOL isOriginal) {
        UIImage *i = images[0];
        self.iv.image = i;
        [self.iv ha_calculateHeight];
    };
    actionSheet.sender = self;
    [actionSheet showPreviewAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
