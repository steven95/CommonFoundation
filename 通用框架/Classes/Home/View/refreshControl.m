//
//  refreshControl.m
//  通用框架
//
//  Created by Jusive on 16/1/28.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "refreshControl.h"

@interface refreshControl ()

@end
@implementation refreshControl

- (void)drawRect:(CGRect)rect {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSMutableArray *array = [NSMutableArray array];
        UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 250)];
        for (int i = 1; i <= 4; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd",i]];
            [array addObject:image];
        }
        imv.animationImages = array;
        imv.animationDuration = imv.animationImages.count *0.5;
        [imv startAnimating];
        [self addSubview:imv];
        [imv performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:imv.animationDuration];
    });
    
    
}
//-(void)layoutSubviews{
//    
//}

@end
