//
//  ViewController.m
//  LueLueLue
//
//  Created by inception on 2018/6/14.
//  Copyright © 2018年 hjy. All rights reserved.
//

#import "ViewController.h"
#import "BKVerticalWaterFallVC.h"
#import "BKAimationVC.h"
#import "BKMasonryTableVC.h"
#import "BKLuaVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *dataArr;
@property(nonatomic, strong) NSArray *vcArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"T";
    
    self.dataArr = @[@"瀑布流",@"动画",@"Mas",@"Lua"];
    self.vcArr = @[@"BKVerticalWaterFallVC",@"BKAimationVC",@"BKMasonryTableVC",@"BKLuaVC"];
    
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Class class = NSClassFromString(self.vcArr[indexPath.row]);
    UIViewController *vc = [[class alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavH, kWidth, kHeight - kNavH - kBottom) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
