//
//  BKAimationVC.m
//  LueLueLue
//
//  Created by inception on 2018/6/14.
//  Copyright © 2018年 hjy. All rights reserved.
//

#import "BKAimationVC.h"
#import "Person.h"

@interface BKAimationVC ()

@property(nonatomic, strong) NSMutableArray *dataArr;
@property(nonatomic, strong) Person *p;
@property(nonatomic, weak) NSTimer *timer;
@property(nonatomic,strong) UILabel *verLbl;
@property(nonatomic, assign) BOOL animat;
@end

@implementation BKAimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    
    self.p = [[Person alloc] init];
    self.p.name = @"hjy";
    [self.p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    
    UITextView *tv = [[UITextView alloc] initWithFrame:CGRectMake(0, kNavH, kWidth, 100)];
    tv.text = @"前面一直提到Timer Source作为事件源，事实上它的上层对应就是NSTimer（其实就是CFRunloopTimerRef）这个开发者经常用到的定时器（底层基于使用mk_timer实现），甚至很多开发者接触RunLoop还是从NSTimer开始的。其实NSTimer定时器的触发正是基于RunLoop运行的，所以使用NSTimer之前必须注册到RunLoop，但是RunLoop为了节省资源并不会在非常准确的时间点调用定时器，如果一个任务执行时间较长，那么当错过一个时间点后只能等到下一个时间点执行，并不会延后执行（NSTimer提供了一个tolerance属性用于设置宽容度，如果确实想要使用NSTimer并且希望尽可能的准确，则可以设置此属性）。";
    tv.textColor = kBlackColor;
    [self.view addSubview:tv];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [UIView animateWithDuration:5 animations:^{
            self.verLbl.top = kHeight;
        } completion:^(BOOL finished) {
            self.verLbl.top = kNavH;
        }];

    }];
    self.timer = timer;
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    
    
    
    
    
    self.verLbl = [UILabel buildLabelWithFrame:CGRectMake(150, kNavH, 20, 0) content:@"1234567890" textColor:[UIColor redColor] font:BKFontR(20) textAlignment:1 lines:0];
    [self.verLbl ha_calculateHeight];
    [self.view addSubview:self.verLbl];
    
    
    self.animat = NO;
    
    
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.animat = !self.animat;
    
    

    
    
//    [self initDanmu];
//    self.p.name = @"k";
//
//
//
//    NSString *str = @"abcdetr";
//
//
//    NSUInteger i = 0;
//    NSUInteger j = str.length - 1;
//    unichar characters[str.length];
//    while (i < j) {
//        characters[j] = [str characterAtIndex:i];
//        characters[i] = [str characterAtIndex:j];
//        i++;
//        j--;
//    }
//    if (i == j) {
//        characters[i] = [str characterAtIndex:i];
//    }
//    NSLog(@"%@",[NSString stringWithCharacters:characters length:str.length]);
    
    
    
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_queue_t queue = dispatch_queue_create("abc", DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_group_async(group, queue, ^{
//        sleep(1);
//        NSLog(@"休眠一秒");
//    });
//
//    dispatch_group_async(group, queue, ^{
//        sleep(2);
//        NSLog(@"休眠2秒");
//    });
//
//    dispatch_group_async(group, queue, ^{
//        sleep(4);
//        NSLog(@"休眠4秒");
//    });
//
//    dispatch_group_notify(group, queue, ^{
//        NSLog(@"完成");
//    });
    
    
}
- (void)dealloc {
    [self.timer invalidate];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
}

#pragma mark - UI

- (void)createUI {
    self.navigationItem.title = @"动画";
    self.view.backgroundColor = kWhiteColor;
}

- (void)initDanmu {
    NSInteger textLength = arc4random()%5 + 4;
    NSMutableString *tempStr = [NSMutableString new];
    for (int j = 0; j < textLength; j ++) {
        [tempStr appendString:[NSString stringWithFormat:@"%d",j]];
    }
    
    CGFloat y = kNavH + arc4random()%200;
    UILabel *lbl = [UILabel buildLabelWithFrame:CGRectMake(kWidth, y, 0, 0) content:tempStr textColor:[UIColor randomColor] font:BKFontR(15) textAlignment:0 lines:1];
    [lbl ha_calculateWidthSingleLine];
    [lbl ha_calculateHeight];
    
    [self.view addSubview:lbl];
    CGFloat speed = kWidth / 5;
    CGFloat curTime = (lbl.width + kWidth)/speed;
    [UIView animateWithDuration:curTime animations:^{
        lbl.left = - lbl.width;
    } completion:^(BOOL finished) {
        [lbl removeFromSuperview];
    }];
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
