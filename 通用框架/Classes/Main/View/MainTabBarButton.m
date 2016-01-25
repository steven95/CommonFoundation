//
//  MainTabBarButton.m
//  通用框架
//
//  Created by Jusive on 16/1/15.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "MainTabBarButton.h"
#import "MainTabBarController.h"
@interface MainTabBarButton ()

@end
@implementation MainTabBarButton


- (UIButton *)image:(UIImageRenderingMode)image imageName:(NSString *)imageName imageHightName:(NSString *)imageHightName index:(int)index{
    [self setImage:[[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [self setImage:[[UIImage imageNamed:imageHightName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    MainTabBarController *mainTabBarController = [MainTabBarController new];
    mainTabBarController  = [mainTabBarController sharedmainTabBarController];
    CGFloat btnY =mainTabBarController.tabBar.bounds.origin.y;
    CGFloat btnW = mainTabBarController.tabBar.bounds.size.width / 4;
    CGFloat btnH = mainTabBarController.tabBar.bounds.size.height;
    CGFloat btnX = mainTabBarController.tabBar.bounds.origin.x + ( index*mainTabBarController.tabBar.bounds.size.width);
        self.frame = CGRectMake(btnX, btnY, btnW, btnH);
    return self;
}
@end
