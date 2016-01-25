
//
//  HomeTableViewCell.m
//  通用框架
//
//  Created by Jusive on 16/1/25.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "HomeTableViewCell.h"
#import <Masonry.h>


@implementation HomeTableViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imgv = [UIImageView new];
        [self addSubview:imgv];
        UILabel *lal = [UILabel new];
        [self addSubview:lal];
    }
    return self;
}

-(void)layoutSubviews{
     self.subviews[0] mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo()
     }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
