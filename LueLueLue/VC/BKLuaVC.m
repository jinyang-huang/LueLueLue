//
//  BKLuaVC.m
//  LueLueLue
//
//  Created by inception on 2018/6/15.
//  Copyright © 2018年 hjy. All rights reserved.
//

#import "BKLuaVC.h"
#import "LuaScriptCore.h"
#import "LogModule.h"
#import "LSCTPerson.h"
#import "LSCTNativeData.h"

@interface BKLuaVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *dataArr;
@property(nonatomic, strong) NSArray *methodArr;

/**
 lua上下文
 */
@property(nonatomic, strong) LSCContext *context;

/**
 是否注册方法
 */
@property(nonatomic) BOOL hasRegMethod;

/**
 *  是否注册模块
 */
@property (nonatomic) BOOL hasRegModule;

/**
 *  是否注册类
 */
@property (nonatomic) BOOL hasRegClass;


/**
 是否导入类
 */
@property (nonatomic) BOOL hasImportClass;

@end

@implementation BKLuaVC

CGFloat kH = 200;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.dataArr = [@[@"解析脚本按钮点击事件",@"注册方法按钮点击事件",@"调用lua方法点击事件",@"注册模块按钮点击事件",@"注册类按钮点击事件",@"导入原生类型按钮点击事件",@"2",@"2",@"2",@"2",@"2",@"2",@"2",@"2",@"2",@"2",@"2",@"2"] mutableCopy];
    self.methodArr = [@[@"evalScriptButtonClickedHandler",@"regMethodClickedHandler",@"callLuaMethodClickedHandler",@"registerModuleClickedHandler",@"registerClassClickedHandler",@"importNativeClassClickedHandler"] mutableCopy];
    
    
    
    
    [self createUI];
    // Do any additional setup after loading the view.
}

#pragma mark - UI

- (void)createUI {
    self.navigationItem.title = @"Lua";
//    [self.view addSubview:self.tableView];

    self.view.backgroundColor = [UIColor randomColor];
    
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, kNavH, kWidth, kHeight - kNavH - kBottom)];
    bgView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    [self.view addSubview:bgView];
    
    bgView.clipsToBounds = NO;
    [bgView addSubview:self.tableView];
    
    CGFloat curH =  200;
    self.tableView.backgroundColor = bgView.backgroundColor;
    self.tableView.frame = CGRectMake(0, curH, kWidth, bgView.height - kBottom - curH);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offP = scrollView.contentOffset;
    if (offP.y < 0) {
        return;
    }
    
//    NSLog(@"%f",offP.y);
//
//    CGFloat curH = kNavH + 200 - offP.y;
//    curH = MAX(kNavH, curH);
//    self.tableView.frame = CGRectMake(0, curH, kWidth, kHeight - kBottom - curH);
//    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:NO];
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{

}


/**
 解析脚本按钮点击事件
 
 */
- (void)evalScriptButtonClickedHandler
{
    //解析并执行Lua脚本
    LSCValue *retValue =
    [self.context evalScriptFromString:@"print(10);return 'Hello World';"];
    NSLog(@"%@", [retValue toString]);
}


/**
 注册方法按钮点击事件
 
 */
- (void)regMethodClickedHandler
{
    if (!self.hasRegMethod) {
        self.hasRegMethod = YES;
        
        //注册方法
        [self.context
         registerMethodWithName:@"getDeviceInfo"
         block:^LSCValue *(NSArray *arguments) {
             
             NSMutableDictionary *info =
             [NSMutableDictionary dictionary];
             [info setObject:[UIDevice currentDevice].name
                      forKey:@"deviceName"];
             [info setObject:[UIDevice currentDevice].model
                      forKey:@"deviceModel"];
             [info setObject:[UIDevice currentDevice].systemName
                      forKey:@"systemName"];
             [info
              setObject:[UIDevice currentDevice].systemVersion
              forKey:@"systemVersion"];
             
             return [LSCValue dictionaryValue:info];
             
         }];
    }
    
    //调用脚本
    [self.context evalScriptFromFile:@"main.lua"];
}


/**
 调用lua方法点击事件
 
 */
- (void)callLuaMethodClickedHandler {
    //加载Lua脚本
    [self.context evalScriptFromFile:@"todo.lua"];
    
    //调用Lua方法
    LSCValue *value = [self.context callMethodWithName:@"add"
                                             arguments:@[
                                                         [LSCValue integerValue:1000],
                                                         [LSCValue integerValue:24]
                                                         ]];
    NSLog(@"result = %@", [value toNumber]);
}


/**
 注册模块按钮点击事件
 
 */
- (void)registerModuleClickedHandler
{
    [self.context evalScriptFromString:@"LogModule:writeLog('Hello Lua Module!');"];
}


/**
 注册类按钮点击事件
 
 */
- (void)registerClassClickedHandler
{
    [self.context evalScriptFromFile:@"test.lua"];
}


/**
 导入原生类型按钮点击事件
 
 */
- (void)importNativeClassClickedHandler
{
    [self.context evalScriptFromString:@"Object:typeMapping('ios', 'LSCTNativeData', 'Data'); print(Data); local d = Data(); print(d); d.dataId = 'xxxx'; print(d.dataId); d:setData('xxx','testKey'); print(d:getData('testKey'));"];
}









#pragma mark - tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.methodArr.count <= indexPath.row) {
        return;
    }
    NSString *methodStr = self.methodArr[indexPath.row];
    SEL selector= NSSelectorFromString(methodStr);
    [self performSelector:selector];
}

#pragma mark - private method


#pragma mark - getter

- (NSMutableArray *)dataArr{
    return _dataArr;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavH, kWidth, kHeight - kBottom - kNavH) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = kWhiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
