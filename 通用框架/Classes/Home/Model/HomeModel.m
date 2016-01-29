//
//  HomeModel.m
//  通用框架
//
//  Created by Jusive on 16/1/25.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
+(instancetype)homeWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

+(void)homeModelWithstring:(NSString *)urlstring   Success:(void(^)(NSArray *array))success errorBlock:(void(^)(NSError *errer))errorBlock{
    
      [[NetWorkTools sharedNetWorkTool] GET: [NetWorkTools str:@"http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html"] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task,NSDictionary *dic) {
             //字典转模型
          NSArray *array = dic[dic.keyEnumerator.nextObject];
             NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:10];
             [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                 HomeModel *model = [HomeModel homeWithDic:obj];
                 [arrayM addObject:model];
             }];
             if (success) {
                 success(arrayM.copy);
             }
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             if (errorBlock) {
                 errorBlock(error);
             }
         }];
}
@end
