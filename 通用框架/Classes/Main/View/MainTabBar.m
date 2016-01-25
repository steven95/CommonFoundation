
//
//  MainTabBar.m
//  通用框架
//
//  Created by Jusive on 16/1/15.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "MainTabBar.h"
#import "MainTabBarButton.h"
#import "UIView+setFrame.h"
#import "MainTabBarController.h"
@interface MainTabBar ()

@end
static MainTabBar *mainTabBar = nil;
@implementation MainTabBar

-(void)layoutSubviews{
    NSInteger count = self.subviews.count - 1;
    MainTabBarController *mainTabBarController = [MainTabBarController new];
    mainTabBarController  = [mainTabBarController sharedmainTabBarController];
    CGFloat btnY =mainTabBarController.tabBar.bounds.origin.y;
    CGFloat btnW = mainTabBarController.tabBar.bounds.size.width / 4;
    CGFloat btnH = mainTabBarController.tabBar.bounds.size.height;
    CGFloat btnX = mainTabBarController.tabBar.bounds.origin.x;
    
    for (int i = 0; i<=count ; i++) {
        MainTabBarButton *btn = self.subviews[i];
    btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

-(MainTabBar *)sharedmainTabBar{
    if (mainTabBar == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            MainTabBar  *mainTBar = [MainTabBar new];
            mainTabBar = mainTBar;
        });
    }
    return mainTabBar;
}
@end
