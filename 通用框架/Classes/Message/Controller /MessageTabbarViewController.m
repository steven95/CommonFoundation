//
//  MessageTabbarViewController.m
//  通用框架
//
//  Created by Jusive on 16/1/20.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "MessageTabbarViewController.h"

@interface MessageTabbarViewController ()

@end
static MessageTabbarViewController *messTabBarController = nil;
@implementation MessageTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(MessageTabbarViewController *)sharedmessTabBarController{
    if (messTabBarController == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            MessageTabbarViewController *messTBarController = [MessageTabbarViewController new];
            messTabBarController = messTBarController;
        });
    }
    return messTabBarController;
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
