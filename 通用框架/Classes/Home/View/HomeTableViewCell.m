
//
//  HomeTableViewCell.m
//  通用框架
//
//  Created by Jusive on 16/1/25.
//  Copyright © 2016年 Jusive. All rights reserved.
//
#define Kright [UIScreen mainScreen].bounds / 4;
#import "HomeTableViewCell.h"
#import <Masonry.h>

@interface HomeTableViewCell ()

@end
@implementation HomeTableViewCell

-(void)setHome:(HomeModel *)home{
       _home = home;
NSMutableString *strM = (NSMutableString *)home.icon;
 NSString *str =[strM stringByReplacingOccurrencesOfString:@"@2x.png" withString:@""];
     self.imageView.image = [UIImage imageNamed:str];
    self.textLabel.text = home.title;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
