//
//  TRStudent.m
//  day02-3
//
//  Created by tarena on 14-3-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(id)initWithAge:(int)age andName:(NSString*)name{
    if (self = [super init]) {
        self.age = age;
        self.name = name;
    }
    return self;
}
+(id)studentWithAge:(int)age andName:(NSString*)name{
    return [[TRStudent alloc]initWithAge:age andName:name];
}
//如果想查看对象中的信息 可以重写本方法
-(NSString *)description{
    return [NSString stringWithFormat:@"age:%d name:%@",self.age,self.name ];
}
@end
