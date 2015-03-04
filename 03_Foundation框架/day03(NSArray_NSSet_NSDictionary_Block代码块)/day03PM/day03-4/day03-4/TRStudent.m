//
//  TRStudent.m
//  day03-4
//
//  Created by tarena on 14-3-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(NSComparisonResult)compareStudentAge:(TRStudent *)stu2{
    if(self.age<stu2.age){
        return -NSOrderedAscending;
    }else if (self.age>stu2.age){
        return -NSOrderedDescending;
    }else{//年龄相同的情况下 再比姓名
        return [self.name compare:stu2.name];
    }
}
-(NSComparisonResult)compareStudent:(TRStudent *)stu2{
    return [self.name compare:stu2.name];
}
-(NSString *)description{
    return [NSString stringWithFormat:@"age:%d name:%@",self.age,self.name];
}
@end





