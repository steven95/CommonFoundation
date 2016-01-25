
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
@property (nonatomic,strong) UIImageView *imv;
@property (nonatomic,weak) UILabel *lal;
@end
@implementation HomeTableViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       
    }
    return self;
}

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
    self.imageView.image = [UIImage imageNamed:home.icon];
    self.textLabel.text = home.title;
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    

    // Configure the view for the selected state
}

@end
