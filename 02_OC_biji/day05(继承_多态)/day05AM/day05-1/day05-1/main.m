//
//  main.m
//  day05-1
//
//  Created by tarena on 14-3-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"
#import "SubClass.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //子类拥有父类的属性和方法
        //但是和数据无关
        MyClass* myClass = [[MyClass alloc]init];
        myClass.age = 10;
        NSLog(@"age:%d",myClass.age);
        SubClass* subClass = [[SubClass alloc]init];
        NSLog(@"sub age:%d",subClass.age);
        
    }
    return 0;
}

