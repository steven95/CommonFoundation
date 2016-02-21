//
//  HomeModel.h
//  通用框架
//
//  Created by Jusive on 16/1/25.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkTools.h"
@interface HomeModel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *digest;
@property (nonatomic,copy) NSString *imgsrc;
@property (nonatomic,copy) NSString *customUrl;

-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)homeWithDic:(NSDictionary *)dic;

+(void)homeModelWithstring:(NSString *)urlstring   Success:(void(^)(NSMutableArray *array))success errorBlock:(void(^)(NSError *errer))errorBlock;
@end
