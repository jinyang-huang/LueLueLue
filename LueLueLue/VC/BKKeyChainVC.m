//
//  BKKeyChainVC.m
//  LueLueLue
//
//  Created by inception on 2018/6/19.
//  Copyright © 2018年 hjy. All rights reserved.
//

#import "BKKeyChainVC.h"
#import "KeychainItemWrapper.h"
#import <AdSupport/AdSupport.h>
@interface BKKeyChainVC ()

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation BKKeyChainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view.
}

#pragma mark - UI

- (void)createUI {
    self.navigationItem.title = @"KeyChain";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"uuid" accessGroup:nil];// 通过同样的标志创建keychain
    // 获取对应Key里保存的uuidData
    NSString *uuidData = [keychain objectForKey:(__bridge id)(kSecValueData)];
    if (uuidData.length > 0) {
        [self.view showTips:[NSString stringWithFormat:@"keychain取得广告标识符 - %@",uuidData]];
    }
    else{
        UI_APPEARANCE_SELECTOR
        // 广告标识符
        NSString *idFA = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        [self.view showTips:[NSString stringWithFormat:@"广告标识符 - %@",idFA]];
        [keychain setObject:idFA forKey:(__bridge id)(kSecValueData)];// 设置密码对应Key的值
    }
    
    NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSLog(@"uuid - %@",uuid);
    
}

#pragma mark - private method


#pragma mark - getter

- (NSMutableArray *)dataArr{
    return _dataArr;
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
