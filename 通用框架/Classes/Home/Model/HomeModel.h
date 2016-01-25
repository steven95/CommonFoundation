//
//  HomeModel.h
//  通用框架
//
//  Created by Jusive on 16/1/25.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *customUrl;

-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)homeWithDic:(NSDictionary *)dic;
@end
