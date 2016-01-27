
//
//  minview.m
//  通用框架
//
//  Created by Jusive on 16/1/27.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "minview.h"

@implementation minview

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:@"minclose" object:self];
    
}
@end
