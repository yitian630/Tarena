//
//  main.m
//  day06-1
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
/* oog
 创建一个TREmployee类，TRStaff普通职员，TRManager领导，工资salary、工种job、姓名name，方法输出个人信息print，如果相应的工种领导的工资会比普通职员高2000。TRHR类，人力资源，通过参数来招人，最少代码。(多态、初始化、工厂方法、内存管理)
 1软件工程师6000
 2测试工程师4500
 3高级软件工程师8000
 4 软+领 5 测+领 6 高软+领
 */
#import <Foundation/Foundation.h>
#import "TREmployee.h"
#import "TRStaff.h"
#import "TRManager.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        TREmployee* emp1 = [[TRStaff alloc]initWithName:@"zhangsan" andJob:@"高级软件工程师" andSalary:6000];
        [emp1 print];
        TREmployee* emp2 = [[TRManager alloc]initWithName:@"lisi" andJob:@"高级软件工程师" andSalary:6000];
        [emp2 print];
        TREmployee* emp3 = [TREmployee HRByNum:6];
        [emp3 print];
        
    }
    return 0;
}

