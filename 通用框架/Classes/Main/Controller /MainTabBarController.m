
//
//  MainTabBarController.m
//  通用框架
//
//  Created by Jusive on 16/1/15.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()
@end
static MainTabBarController *mainTabBarController = nil;
@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(MainTabBarController *)sharedmainTabBarController{
    if (mainTabBarController == nil) {
      static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            MainTabBarController *mainTBarController = [MainTabBarController new];
            mainTabBarController = mainTBarController;
        });
     }
    return mainTabBarController;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
