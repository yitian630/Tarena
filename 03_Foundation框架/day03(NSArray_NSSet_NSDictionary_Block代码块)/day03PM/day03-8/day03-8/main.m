//
//  main.m
//  day03-8
//
//  Created by tarena on 14-3-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
//学生与学校的故事
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
        NSArray* class1402A = @[stu1,stu2];
        NSArray* class1402B = @[stu3,stu4];
        NSArray* class1402C = @[stu5,stu6];
        NSArray* class1402D = @[stu7,stu8];
        //学院
        NSMutableDictionary* tarena3G=[NSMutableDictionary dictionaryWithObjectsAndKeys:class1402A,@"class1402A",class1402B,@"class1402B", nil];
        NSMutableDictionary* tarenaTest=[NSMutableDictionary dictionaryWithObjectsAndKeys:class1402C,@"class1402C",class1402D,@"class1402D", nil];
        //学校
        NSMutableDictionary* tarena = [NSMutableDictionary dictionaryWithObjectsAndKeys:tarena3G,@"tarena3G",tarenaTest,@"tarenaTest", nil];
        
        //遍历 学校
        NSArray* tarenaAllKeys = [tarena allKeys];
        for (NSString* collegeKey in tarenaAllKeys) {
            /*区分不同的学院*/
            //学院
            NSMutableDictionary* college =  [tarena objectForKey:collegeKey];
            //班级
            NSArray* classAllKeys = [college allKeys];
            for (NSString* classKey in classAllKeys) {
                if ([classKey isEqualToString:@"class1402A"]) {
                    NSArray* class= [college objectForKey:classKey];
                    //学生
                    for (TRStudent* stu in class) {
                        /*
                         if (stu.age == 18) {
                         NSLog(@"age:%d stu:%@",stu.age,stu.name);
                         }*/
                        NSLog(@"age:%d stu:%@",stu.age,stu.name);
                    }
                    
                }
            }
        }
        
    }
    return 0;
}

