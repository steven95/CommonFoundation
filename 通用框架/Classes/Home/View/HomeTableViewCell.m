
//
//  HomeTableViewCell.m
//  通用框架
//
//  Created by Jusive on 16/1/25.
//  Copyright © 2016年 Jusive. All rights reserved.
//


#import "HomeTableViewCell.h"
#import <Masonry.h>
#import "HomeController.h"
#import  <Masonry.h>
@interface HomeTableViewCell ()

@end
@implementation HomeTableViewCell

-(void)setHome:(HomeModel *)home{
       _home = home;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSURL *url = [NSURL URLWithString:home.imgsrc];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [UIImage imageWithData:data];
        NSLog(@"%@",img);
        self.imageView.image = img;
        NSLog(@"%@",self.imageView.image);
    });

       self.textLabel.text = home.title;
}
-(void)layoutSubviews{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(10);
        make.bottom.equalTo(self.mas_bottom).with.offset(-10);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-([UIScreen mainScreen].bounds.size.width -90));
    }];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_top);
        make.left.equalTo(self.imageView.mas_right).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.bottom.equalTo(self.imageView.mas_bottom);
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
