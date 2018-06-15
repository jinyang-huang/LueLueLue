//
//  BKMasonryTableVC.m
//  LueLueLue
//
//  Created by inception on 2018/6/15.
//  Copyright © 2018年 hjy. All rights reserved.
//

#import "BKMasonryTableVC.h"
#import "BKMasonryCell.h"
#import "Person.h"
#import "UITableView+FDTemplateLayoutCell.h"
typedef void (^Task)(void);

@interface BKMasonryTableVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *dataArr;
@property(nonatomic, strong) NSMutableArray *taskArr;

@property(nonatomic, assign) CFRunLoopObserverRef observer;

@end

@implementation BKMasonryTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titleArr = @[@"122",@"asd",@"adsdadasdadadasda",@"dasdasdasdsadasdsadasdasdadasdsa"];
    NSArray *detailArr = @[@"1.iOS刨根问底-深入理解RunLoop Kenshin Cui大神的文章 讲的很全但是概念也挺多的，一开始可能会懵但是多看几次会有不少收获。里面关于NSTimer部分可以着重看下，里面提到了ViewController无法释放的问题2.深入理解RunLoop里面关于Mode和实现功能部分讲的很细3.iOS线下分享《RunLoop》 by 孙源 sunnyxx 也是个大神，但是不太推荐作为入门直接去看，视频不管是反复看某一段还是理解都有不便，适合有一定自己理解或者了解了去做个印证或者补充。作者：野生塔塔酱 链接：https://www.jianshu.com/p/18afd628ac43來源：简书简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。",@"asdasdafeeffffffffffffffdaaaaaaaaaaa",@"dasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss",@"asdasdadasda"];
    NSArray *dateArr = @[@"2017-10-10",@"2017-10-10",@"2017-10-10",@"2017-10-10"];
    
    self.taskArr = [NSMutableArray new];
    self.dataArr = [NSMutableArray new];
    for (int j = 0; j < 100; j ++) {
        for (int i = 0; i < 4; i ++) {
            Person * p = [[Person alloc] init];
            p.name = titleArr[i];
            p.detail = detailArr[i];
            p.dateStr = dateArr[i];
            [self.dataArr addObject:p];
        }
    }
    
//    for (int i = 0; i < 100000; i ++){
//        UIView *view = [UIView new];
//        [self.view addSubview:view];
//        if (i == 100000 - 1) {
//            NSLog(@"ok");
//        }
//        else{
//            NSLog(@"============");
//        }
//    }

//    __block NSMutableArray *arr = [[NSMutableArray alloc] init];
//    for (int i = 0; i < 10000; i ++){
//        [arr addObject:@0];
//    }
//    NSLog(@"添加完了");
    
    _observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//        NSLog(@"----监听到RunLoop状态发生改变---%zd", activity);
        
        if ((activity == kCFRunLoopExit || activity == kCFRunLoopBeforeWaiting )  && self.taskArr.count > 0){

            Task t = self.taskArr[0];
            t();
            [self.taskArr removeObjectAtIndex:0];
            CFRunLoopWakeUp(CFRunLoopGetCurrent());
        }
        
//        switch (activity) {
//            case kCFRunLoopEntry:
//                NSLog(@"即将进入runloop");
//                break;
//            case kCFRunLoopBeforeTimers:
//                NSLog(@"即将处理 Timer");
//                break;
//            case kCFRunLoopBeforeSources:
//                NSLog(@"即将处理 Sources");
//                break;
//            case kCFRunLoopBeforeWaiting:
//                NSLog(@"即将进入休眠");
//                break;
//            case kCFRunLoopAfterWaiting:
//                NSLog(@"从休眠中唤醒loop");
//                break;
//            case kCFRunLoopExit:
//                NSLog(@"即将退出runloop");
//                break;
//
//            default:
//                break;
//        }
    });
    /**
     第一个参数：（CFRunLoopRef rl）要监听哪个runloop
     第二个参数：（CFRunLoopObserverRef observer）监听者
     第三个参数：（CFStringRef mode）要监听runloop在哪种运行模式下的状态
     
     */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), _observer, kCFRunLoopDefaultMode);
    
    
    CFRelease(_observer);
    
    [self createUI];
    // Do any additional setup after loading the view.
}

#pragma mark - UI

- (void)createUI {
    self.navigationItem.title = @"Mas";
    [self.view addSubview:self.tableView];
    //设置自动计算行号模式
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //设置预估行高
    self.tableView.estimatedRowHeight = 100;
}

- (void)dealloc {
    CFRunLoopObserverInvalidate(_observer);
}

#pragma mark - tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *identifier = @"cell";
//    BKMasonryCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (!cell) {
//        cell = [[BKMasonryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
//    [cell prepareForReuse];
//    cell.model = self.dataArr[indexPath.row];
//    [cell layoutIfNeeded];
//    cell.contentView.translatesAutoresizingMaskIntoConstraints = NO;
//
////    NSLayoutConstraint *widthFenceConstraint = [NSLayoutConstraint constraintWithItem:cell.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:kWidth];
//
//    CGFloat fittingHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
////    [cell.contentView removeConstraint:widthFenceConstraint];
//    return fittingHeight + 1;
////    return [tableView fd_heightForCellWithIdentifier:@"cell" cacheByIndexPath:indexPath configuration:^(BKMasonryCell *cell) {
////        [self configureCell:cell atIndexPath:indexPath];
////    }];
//}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 60;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
//    BKMasonryCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    [self configureCell:cell atIndexPath:indexPath];
//    return cell;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
    }
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    Task task1 = ^{
        [self addImage1:cell];
    };
    Task task2 = ^{
        [self addImage2:cell];
    };
    Task task3 = ^{
        [self addImage3:cell];
    };
    [self.taskArr addObject:task1];
    [self.taskArr addObject:task2];
    [self.taskArr addObject:task3];
    return cell;
}

- (void)addImage1:(UITableViewCell *)cell {
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, kWidth/3 - 10, 80)];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"timg" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    iv.image = image;
    [UIView transitionWithView:cell.contentView duration:0.2 options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:iv];
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)addImage2:(UITableViewCell *)cell {
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth/3, 10, kWidth/3 - 10, 80)];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"timg" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    iv.image = image;
    [UIView transitionWithView:cell.contentView duration:0.2 options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:iv];
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)addImage3:(UITableViewCell *)cell {
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth/3.0 * 2.0, 10, kWidth/3 - 10, 80)];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"timg" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    iv.image = image;
    
    [UIView transitionWithView:cell.contentView duration:0.2 options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:iv];
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)configureCell:(BKMasonryCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.fd_enforceFrameLayout = NO; // Enable to use "-sizeThatFits:"
    cell.model = self.dataArr[indexPath.row];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
        [_tableView registerClass:[BKMasonryCell class] forCellReuseIdentifier:@"cell"];
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
