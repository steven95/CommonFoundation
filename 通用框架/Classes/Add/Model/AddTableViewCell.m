
//
//  AddTableViewCell.m
//  通用框架
//
//  Created by Jusive on 16/1/25.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "AddTableViewCell.h"
#import "Addtable.h"

@interface AddTableViewCell ()

@end
@implementation AddTableViewCell

-(void)setModel:(Addtable *)model{
    
    self.imageView.image = [UIImage imageNamed:model.icon];
    self.textLabel.text = model.title;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
