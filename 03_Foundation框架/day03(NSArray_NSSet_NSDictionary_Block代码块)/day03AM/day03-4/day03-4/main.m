//
//  main.m
//  day03-4
//
//  Created by tarena on 14-3-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
/*数组的排序*/
#import <Foundation/Foundation.h>
#import "TRStudent.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSArray* array = @[@"a",@"c",@"b"];
        //NSMutableArray* array3 = @[@"1",@"3",@"2"];
        NSMutableArray* array3 = [[NSMutableArray alloc]initWithObjects:@"1",@"3",@"2", nil];
        NSLog(@"array:%@",array);
        //数组排序(比较)的规则
        SEL sel = @selector(compare:);
        NSArray* array2 = [array sortedArrayUsingSelector:sel];
        NSLog(@"array2:%@",array2);
        
        //创建三个学生对象 按姓名排序？英文
        TRStudent* stu = [[TRStudent alloc]init];
        stu.name = @"zhangsan";//19
        stu.age = 19;
        TRStudent* stu2 = [[TRStudent alloc]init];
        stu2.name = @"lisi";//17
        stu2.age = 17;
        TRStudent* stu3 = [[TRStudent alloc]init];
        stu3.name = @"wangwu";//18
        stu3.age = 18;
        TRStudent* stu4 = [[TRStudent alloc]init];
        stu4.name = @"aoliu";//18
        stu4.age = 18;
        NSArray* persons = @[stu,stu2,stu3,stu4];
        NSLog(@"persons:%@",persons);
        SEL sel2 = @selector(compareStudentAge:);
        NSArray* persons2 = [persons sortedArrayUsingSelector:sel2];
        NSLog(@"persons2:%@",persons2);
    }
    return 0;
}

