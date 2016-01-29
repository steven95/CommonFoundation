
//
//  NetWorkTools.m
//  通用框架
//
//  Created by Jusive on 16/1/27.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "NetWorkTools.h"
typedef enum{
    
    GET,
    POST,
    HEAD
    
}RequestMethod;
static NSString *strurl = nil;
@implementation NetWorkTools
//放在.h里就会报警告,不知所以
-(void)method:(RequestMethod)method urlString:(NSString *)urlString parameters:(NSString *)parameters progress:(void (^)(NSProgress * _Nonnull))Progress success:(void(^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void(^)(NSURLSessionDataTask *_Null_unspecified ,NSError * _Null_unspecified))failure{
    if (method == GET)
   [self GET:urlString parameters:parameters progress:Progress success:success failure:failure];
    if (method == POST)
   [self POST:urlString parameters:parameters progress:Progress success:success failure:failure];
}
-(void)method:(RequestMethod)method urlString:(NSString *)urlString parameters:(NSString *)parameters success:(void(^)(NSURLSessionDataTask * _Null_unspecified))success failure:(void(^)(NSURLSessionDataTask *_Null_unspecified ,NSError * _Null_unspecified))failure{
    
     if (method == HEAD)
    [self HEAD:urlString parameters:parameters success:success failure:failure];
}

//网络工具类的单例
+(AFHTTPSessionManager *)sharedNetWorkTool{
    static AFHTTPSessionManager *sharedNetWorkTool = nil;
    static dispatch_once_t instance;
    dispatch_once(&instance, ^{
        NSString *strr = [self str:(strurl)];
//    NSString *str = @"http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html";
    NSURL *baseUrl = [NSURL URLWithString:strr];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 15;
        sharedNetWorkTool = [[self alloc]initWithBaseURL:baseUrl sessionConfiguration:config];
        sharedNetWorkTool.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/html", @"text/javascript", nil];
    });

    return sharedNetWorkTool;
}
+(NSString *)str:(NSString *)urlstr{
      strurl = urlstr;
    return strurl;
}
@end
