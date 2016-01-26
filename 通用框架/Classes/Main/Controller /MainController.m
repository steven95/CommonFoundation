
//
//  MainController.m
//  通用框架
//
//  Created by Jusive on 16/1/24.
//  Copyright © 2016年 Jusive. All rights reserved.
//
#define kScreenWidth          [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height
#define kMorePageDistance  100
#define kMainPageCenter  CGPointMake(kScreenWidth + kScreenWidth  / 2.0 - kMorePageDistance, kScreenHeight / 2) //打开左侧窗时，中视图(右视图)露出的宽度
#define maxY 60
#define targetRX 300;
#define targetLX -250;

#import "UIView+setFrame.h"
#import "MainController.h"
#import "MainViewController.h"
#import "AddTableViewController.h"
@interface MainController ()<UIGestureRecognizerDelegate>
@property (nonatomic,strong) UISwipeGestureRecognizer *leftswipeGestureRecongnizer;
@property (nonatomic,strong) UISwipeGestureRecognizer *RightswipeGestureRecongnizer;
//滑动速度系数-建议在0.5-1之间。默认为0.5
@property (nonatomic, assign) CGFloat speedf;
@property (nonatomic,assign) BOOL isDranging;
@property (nonatomic, assign) BOOL closed;
@end
static MainController *mainviewController = nil;
@implementation MainController
//单列
-(MainController *)sharedmainViewController{
    if (mainviewController == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            MainController *mainViewController = [MainController new];
            mainviewController = mainViewController;
        });
    }
    return mainviewController;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    MainViewController *mainViewController = [MainViewController new];
    [self addChildViewController:mainViewController];
    [self.view addSubview:mainViewController.view];
    [self SwipeGestureRecognizer];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//注册滑动效果
-(void)SwipeGestureRecognizer{
    [self.view addObserver:self forKeyPath:@"Kframe" options:NSKeyValueObservingOptionNew context:nil];
    //    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(PanGesture:)];
    self.leftswipeGestureRecongnizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftswipe:)];
    self.RightswipeGestureRecongnizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(Rightswipe:)];
    [self.view addGestureRecognizer:self.leftswipeGestureRecongnizer];
    [self.view addGestureRecognizer:self.RightswipeGestureRecongnizer];
    self.leftswipeGestureRecongnizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.RightswipeGestureRecongnizer.direction = UISwipeGestureRecognizerDirectionRight;
    self.leftswipeGestureRecongnizer.delegate = self;
    self.RightswipeGestureRecongnizer.delegate =self;
    //   [self.view addGestureRecognizer:self.panGestureRecognizer];
    //    [self.panGestureRecognizer setCancelsTouchesInView:YES];
    //    self.panGestureRecognizer.delegate = self;
}
-(void)leftswipe:(UISwipeGestureRecognizer *)swipeGestureRecongnizer{
    if (swipeGestureRecongnizer.direction == UISwipeGestureRecognizerDirectionLeft)
        [self closeLeftView];
}
-(void)Rightswipe:(UISwipeGestureRecognizer *)swipeGestureRecongnizer{
    if (swipeGestureRecongnizer.direction == UISwipeGestureRecognizerDirectionRight)
        [self openLeftView];
}

#pragma mark - 修改视图位置
/**
 @brief 关闭左视图
 */
- (void)closeLeftView{
    [UIView animateWithDuration:0.5 animations:^{
        self.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        self.view.center = CGPointMake(kScreenWidth / 2, kScreenHeight / 2);
    }];
}

/**
 @brief 打开左视图
 */
- (void)openLeftView{
    [UIView beginAnimations:nil context:nil];
    self.view.center = kMainPageCenter;
    self.closed = YES;
    [UIView commitAnimations];
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
