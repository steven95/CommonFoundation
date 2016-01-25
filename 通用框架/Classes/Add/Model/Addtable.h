//
//  Addtable.h
//  通用框架
//
//  Created by Jusive on 16/1/25.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Addtable : NSObject
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *title;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)addtableWithDict:(NSDictionary *)dict;
@end
