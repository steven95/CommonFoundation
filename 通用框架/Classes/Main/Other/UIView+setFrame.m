//
//  UIView+setFrame.m
//  彩票
//
//  Created by Jusive on 15/12/2.
//  Copyright © 2015年 Jusive. All rights reserved.
//

#import "UIView+setFrame.h"

@implementation UIView (setFrame)
//设置x
-(CGFloat)x{
    return self.frame.origin.x;
}
-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

//设置y
-(CGFloat)y{
    return self.frame.origin.y;
}
-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

//设置w
-(CGFloat)w{
    return  self.frame.size.width;
}
-(void)setW:(CGFloat)w{
    CGRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
}

//设置h
-(CGFloat)h{
    return self.frame.size.height;
}
-(void)setH:(CGFloat)h{
    CGRect frame = self.frame;
    frame.size.height = h;
    self.frame = frame;
}
@end
