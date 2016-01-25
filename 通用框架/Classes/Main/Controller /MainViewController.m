//
//  MainViewController.m
//  通用框架
//
//  Created by Jusive on 16/1/11.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "MainViewController.h"
#import "DiscoverController.h"
#import "HomeController.h"
#import "AddController.h"
#import "ProfileController.h"
#import "MoreViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController];
}

-(void)VC:(UIViewController *)VC title:(NSString *)title imageName:(NSString *)imageName{
    VC.tabBarItem.title = title;
    VC.title = title;
    self.tabBar.alpha = 0.9;
    VC.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    VC.tabBarItem.image = [UIImage imageNamed:imageName];
    self.tabBar.tintColor = [UIColor orangeColor];
    UINavigationController *Nav = [[UINavigationController alloc]initWithRootViewController:VC];
    [self addChildViewController:Nav];
    
    
}

-(void)addChildViewController{
    HomeController *homeController = [HomeController new];
    AddController *addCollectionViewController = [AddController new];
    ProfileController *profileController = [ProfileController new];
    MoreViewController *moreViewController = [MoreViewController new];
    [self VC:homeController title:@"Home"imageName:@"tabbar_home"];
    [self VC:profileController title:@"Profile" imageName:@"tabbar_profile"];
    [self VC:addCollectionViewController title:@"AddCollection" imageName:@"tabbar_compose_icon_add"];
    [self VC:moreViewController title:@". . ." imageName:@"tabbar_more"];
    
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
