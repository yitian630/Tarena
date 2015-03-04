//
//  main.m
//  day01-2
//
//  Created by tarena on 14-3-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
/*类对象*/
#import <Foundation/Foundation.h>
#import "TRStudent.h"
#import "TRPerson.h"
#import "TRStudentSub.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //类的对象 为了保存对象的具体数值信息
        TRStudent* stu = [[TRStudent alloc]init];
        [stu study];
        //得到一个方法(方法名)
        //SEL方法类型
        SEL s =  @selector(study);
        BOOL funcB = [TRStudent instancesRespondToSelector:s];
        if (funcB) {
            NSLog(@"TRStudent有study方法");
        }else{
           NSLog(@"TRStudent没有study方法");
        }
        
        TRPerson* person = [[TRPerson alloc]init];
        //stu = person;
        
        //类对象 为了保存类的代码信息
        Class class = [TRStudent class];
        //判断一个类是否是另一个类的子类
        BOOL b = [TRPerson isSubclassOfClass:[TRStudent class]];
        if (b) {
            NSLog(@"TRPerson是TRStudent的子类");
        }else{
            NSLog(@"TRPerson不是TRStudent的子类");
        }
        
        BOOL b2 = [TRStudentSub isSubclassOfClass:[TRStudent class]];
        if (b2) {
            NSLog(@"TRStudentSub是TRStudent的子类");
        }else{
            NSLog(@"TRStudentSub不是TRStudent的子类");
        }

        
    }
    return 0;
}

