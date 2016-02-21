

//
//  coverView.m
//  通用框架
//
//  Created by Jusive on 16/1/26.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "coverView.h"
#import "HomeController.h"

@interface coverView ()
@property (nonatomic,strong) HomeController *home;
@end
@implementation coverView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self removeFromSuperview];
  [[NSNotificationCenter defaultCenter] postNotificationName:@"close" object:self];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
