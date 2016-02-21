//
//  MessageViewController.m
//  通用框架
//
//  Created by Jusive on 16/1/20.
//  Copyright © 2016年 Jusive. All rights reserved.
//
#define kScreenWidth          [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height
#define kMorePageDistance  100
#define kMainPageCenter  CGPointMake(kScreenWidth + kScreenWidth  / 2.0 - kMorePageDistance, kScreenHeight / 2) //打开左侧窗时，中视图(右视图)露出的宽度

#import "MessageViewController.h"
#import "MssageNavigationViewController.h"
#import "MessageTabbarViewController.h"
#import "MainController.h"

@interface MessageViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic,strong) UISwipeGestureRecognizer *leftswipeGestureRecongnizer;
@property (nonatomic,strong) MainController *main;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MssageNavigationViewController *messNavController = [MssageNavigationViewController  new];
    messNavController.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:messNavController];
    [self.view addSubview:messNavController.view];
    MessageTabbarViewController *messtabBC = [MessageTabbarViewController new];
    messtabBC =[messtabBC sharedmessTabBarController];
    [self addChildViewController:messtabBC];
    [self.view addSubview:messtabBC.tabBar];
    MainController *mainview = [MainController new];
    self.main = [mainview sharedmainViewController];
    [self addChildViewController:mainview];
    [self.view addSubview:mainview.view];
    self.leftswipeGestureRecongnizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftswipe:)];
    [self.view addGestureRecognizer:self.leftswipeGestureRecongnizer];
    self.leftswipeGestureRecongnizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.leftswipeGestureRecongnizer.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)leftswipe:(UISwipeGestureRecognizer *)swipeGestureRecongnizer{
    [[self.main sharedmainViewController] closeLeftView];
}
-(void)dealloc{
   [self.main removeObserver:self forKeyPath:@"frame"];
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
