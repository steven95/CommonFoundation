
//
//  Addtable.m
//  通用框架
//
//  Created by Jusive on 16/1/25.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "Addtable.h"

@implementation Addtable

-(instancetype)initWithDict:(NSDictionary *)dict{
    //先调super
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
+(instancetype)addtableWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
