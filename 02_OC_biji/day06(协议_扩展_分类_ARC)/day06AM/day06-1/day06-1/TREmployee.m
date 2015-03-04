//
//  TREmployee.m
//  day06-1
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
//代码(内存管理)+需求分析=高级软件工程*3年=项目经理
#import "TREmployee.h"
#import "TRManager.h"
#import "TRStaff.h"
@implementation TREmployee
+(TREmployee*)HRByNum:(int)num{
    switch (num) {
        case 1:
            return [[TRStaff alloc]initWithName:@"zhangsan" andJob:@"软件工程师" andSalary:6000];
        case 2:
            return [[TRStaff alloc]initWithName:@"lisi" andJob:@"测试工程师" andSalary:4500];
            break;
        case 3:
            return [[TRStaff alloc]initWithName:@"wangwu" andJob:@"高级软件工程师" andSalary:8000];
            break;
        case 4:
            return [[TRManager alloc]initWithName:@"zhangsan2" andJob:@"软件工程师" andSalary:6000];
            break;
        case 5:
            return [[TRManager alloc]initWithName:@"lisi" andJob:@"测试工程师" andSalary:4500];
            break;
        case 6:
            return [[TRManager alloc]initWithName:@"wangwu" andJob:@"高级软件工程师" andSalary:8000];
            break;
    }
    return Nil;
}
-(void)print{
    NSLog(@"员工的信息 姓名:%@ job:%@ salary:%f",self.name,self.job,self.salary);
}
@end




