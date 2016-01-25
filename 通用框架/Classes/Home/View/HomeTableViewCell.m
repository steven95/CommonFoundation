
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

//-(void)layoutSubviews{
//   
//    [self.imv mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.superview.mas_top).with.offset(10);
//        make.left.equalTo(self.superview.mas_left).with.offset(10);
//        make.bottom.equalTo(self.superview.mas_bottom).with.offset(-10);
//        make.right.equalTo(self.superview.mas_right).offset(-350);
//    }];
//    [self.lal mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.superview.mas_top).with.offset(10);
//        make.left.equalTo(self.imv.mas_left).with.offset(10);
//        make.bottom.equalTo(self.superview.mas_bottom).with.offset(-10);
//        make.right.equalTo(self.superview.mas_right).with.offset(-10);
//    }];
//}
-(void)setHome:(HomeModel *)home{
       _home = home;
NSMutableString *strM = (NSMutableString *)home.icon;
 NSString *str =[strM stringByReplacingOccurrencesOfString:@"@2x.png" withString:@""];
    NSLog(@"%@",str);
     self.imageView.image = [UIImage imageNamed:str];
    self.textLabel.text = home.title;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    

    // Configure the view for the selected state
}

@end
