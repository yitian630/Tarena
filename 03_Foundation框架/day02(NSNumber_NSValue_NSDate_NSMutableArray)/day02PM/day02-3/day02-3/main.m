//
//  main.m
//  day02-3
//
//  Created by tarena on 14-3-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
/*
 NSArray
 */
#import <Foundation/Foundation.h>
#import "TRStudent.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //初始化
        //没元素的数组
        NSArray* array = [NSArray array];
        NSLog(@"array:%@",array);
        //一个元素的数组
        NSArray* array2 = [NSArray arrayWithObject:@"one"];
        NSLog(@"array2:%@",array2);
        //多个元素的数组 int arr[3]={1,2,3}
        TRStudent* stu = [[TRStudent alloc]init];
        stu.age = 18;
        stu.name = @"zhangsan";
        NSArray* array3 = [NSArray arrayWithObjects:@"one",@"two",@"three",stu, nil];
        NSLog(@"array3:%@",array3);
        //得到数组的长度
        NSUInteger count = [array3 count];
        NSLog(@"array3:%ld",count);
        //得到数组中元素的值
        NSString* str = [array3 objectAtIndex:0];
        //NSLog(@"str:%@",str);
        //遍历
        for (int i = 0; i<[array3 count]; i++) {
            NSString* str = [array3 objectAtIndex:i];
            NSLog(@"str:%@",str);
        }
        
        /* 
         1.创建一个学生类TRStudent，有年龄、有姓名，创建五个学生对象，放到数组中，遍历数组，输出学生的姓名和年龄。
         */
        TRStudent* stu1 = [TRStudent studentWithAge:18 andName:@"zhangsan"];
        TRStudent* stu2 = [TRStudent studentWithAge:19 andName:@"lisi"];
        TRStudent* stu3 = [TRStudent studentWithAge:20 andName:@"wangwu"];
        TRStudent* stu4 = [TRStudent studentWithAge:21 andName:@"zhaoliu"];
        TRStudent* stu5 = [TRStudent studentWithAge:22 andName:@"qianqi"];
        NSArray* students = [NSArray arrayWithObjects:stu1,stu2,stu3,stu4,stu5, nil];
        for (int i = 0 ; i < [students count]; i++) {
            TRStudent* stu = [students objectAtIndex:i];
            //符合条件的信息才显示zhangsan
            /*
            if ([stu.name isEqualToString:@"zhangsan"] ) {
                NSLog(@"age:%d name:%@",stu.age,stu.name);
            }*/
            if (stu.age==19) {
                NSLog(@"age:%d name:%@",stu.age,stu.name);
            }
            
        }
    }
    return 0;
}

