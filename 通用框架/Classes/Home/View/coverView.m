

//
//  coverView.m
//  通用框架
//
//  Created by Jusive on 16/1/26.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "coverView.h"
#import "HomeController.h"

@implementation coverView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    HomeController *home = [HomeController new];
    [home removeview];
}
@end
