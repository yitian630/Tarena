//
//  main.m
//  day02-5
//
//  Created by tarena on 14-3-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

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
        /*
        NSArray* class1402A = [NSArray arrayWithObjects:stu1,stu2,nil];
         */
        //IOS6数组的新语法
        //保留C语言的语法{}->@[]
        NSArray* class1402A = @[stu1,stu2];
        //[array objectAtIndex]->array[]
        TRStudent* stuTemp = class1402A[0];
        NSLog(@"zhang age:%d",stuTemp.age);
        
        NSArray* class1402B = [NSArray arrayWithObjects:stu3,stu4,nil];
        NSArray* class1402C = [NSArray arrayWithObjects:stu5,stu6,nil];
        NSArray* class1402D = [NSArray arrayWithObjects:stu7,stu8,nil];
        //学院
        NSArray* tarena3G = [NSArray arrayWithObjects:class1402A,class1402B,nil];
        NSArray* tarenaTest = [NSArray arrayWithObjects:class1402C,class1402D,nil];
        //学校
        NSArray* tarena = [NSArray arrayWithObjects:tarena3G,tarenaTest,nil];
        
        //遍历for
        /*
        //学校
        for (int i = 0; i<[tarena count]; i++) {
            NSArray* college = [tarena objectAtIndex:i];
            //学院
            for (int j=0; j<[college count]; j++) {
                NSArray* class = [college objectAtIndex:j];
                //班级
                for (int k = 0; k<[class count]; k++) {
                    TRStudent* stu = [class objectAtIndex:k];
                    //条件过滤
         
                    if ([stu.name isEqualToString:@"zhangsan"]) {
                        NSLog(@"age:%d name:%@",stu.age,stu.name);
                    }
         
                    if (stu.age == 18) {
                        NSLog(@"age:%d name:%@",stu.age,stu.name);
                    }
                    
                }
            }
         
        }*/
        
        //快速枚举 for in
        //学校
        for (NSArray* college in tarena) {
            //学院
            for (NSArray* class in college) {
                //班级
                for (TRStudent* stu in class) {
                    NSLog(@"age:%d name:%@",stu.age,stu.name);
                }
            }
        }
        
    }
    return 0;
}

