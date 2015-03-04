//
//  main.m
//  day02-6
//
//  Created by tarena on 14-3-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
/*快速枚举*/
#import <Foundation/Foundation.h>
#import "TRStudent.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //学生
        TRStudent* stu1 = [TRStudent studentWithAge:18 andName:@"zhangsan"];
        TRStudent* stu2 = [TRStudent studentWithAge:19 andName:@"lisi"];
        TRStudent* stu3 = [TRStudent studentWithAge:20 andName:@"wangwu"];
        TRStudent* stu4 = [TRStudent studentWithAge:21 andName:@"zhaoliu"];
        TRStudent* stu5 = [TRStudent studentWithAge:22 andName:@"qianqi"];
        TRStudent* stu6 = [TRStudent studentWithAge:23 andName:@"guanyu"];
        TRStudent* stu7 = [TRStudent studentWithAge:24 andName:@"zhangfei"];
        TRStudent* stu8 = [TRStudent studentWithAge:25 andName:@"liubei"];
        //班级
        NSArray* class = [NSArray arrayWithObjects:stu1,stu2,stu3,stu4,stu5,stu6,stu7,stu8,nil];
        
        //遍历
        /*
        for (int i = 0; i<[class count]; i++) {
            TRStudent* stu = [class objectAtIndex:i];
            NSLog(@"age:%d name:%@",stu.age,stu.name);
        }
         */
        //快速枚举
        //参数1 循环变量
        //参数2 遍历数组
        /*
        for (TRStudent* stu in class) {
            NSLog(@"age:%d name:%@",stu.age,stu.name);
        }*/
        
        //迭代器遍历
        //迭代器(班长)
        NSEnumerator* enumerator = [class objectEnumerator];
        TRStudent* stu;
        while ((stu=[enumerator nextObject])!=nil) {
            NSLog(@"age:%d name:%@",stu.age,stu.name);
        }
    }
    return 0;
}

