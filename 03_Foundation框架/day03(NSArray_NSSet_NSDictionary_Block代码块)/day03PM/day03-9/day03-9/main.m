//
//  main.m
//  day03-9
//
//  Created by tarena on 14-3-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"
int sum(int a,int b);
int sum(int a,int b){
    return a+b;
}
//Block的声明
//int返回值类型
//^Sum2Block的名称
//(int,int)参数
//=^(int a,int b)实现
int(^Sum2)(int,int)=^(int a,int b){
    return a+b;
};

typedef int(^Sum3)(int,int);
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        int i = 3,j = 2;
        //调用函数
        //int result = sum(i, j);
        
        //调用Block 声明定义
        //int result = Sum2(i,j);
        
        //声明Block类型的变量
        Sum3 sum3=^(int a,int b){
            return a+b;
        };
        //通过变量使用Block
        int result = sum3(i,j);
        NSLog(@"result:%d",result);
        
        //对数组进行排序
        TRStudent* stu1 = [[TRStudent alloc]init];
        stu1.age = 18;
        TRStudent* stu2 = [[TRStudent alloc]init];
        stu2.age = 17;
        TRStudent* stu3 = [[TRStudent alloc]init];
        stu3.age = 19;
        NSArray* students = @[stu1,stu2,stu3];
        NSLog(@"students:%@",students);
        //直接使用Block
        NSArray* students2 = [students sortedArrayUsingComparator:^NSComparisonResult(TRStudent* stu,TRStudent* stu2){
            if (stu.age<stu2.age) {
                return NSOrderedAscending;
            }else if (stu.age>stu2.age){
                return NSOrderedDescending;
            }else{
                return NSOrderedSame;
            }
        }];
        NSLog(@"students2:%@",students2);
    }
    return 0;
}

