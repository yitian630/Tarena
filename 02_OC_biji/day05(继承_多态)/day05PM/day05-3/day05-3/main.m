//
//  main.m
//  day05-3
//
//  Created by tarena on 14-3-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"
#import "SubClass.h"
#import "SubClass2.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //引用多态
        //父类的引用可以指向本类对象
        MyClass* o1 = [[MyClass alloc]init];
        //父类的引用可以指向子类对象
        MyClass* o2 = [[SubClass alloc]init];//没有"重写"父类的方法
        MyClass* o3 = [[SubClass2 alloc]init];//重写了父类的方法
        
        //方法多态
        [o1 method];//调用本类方法
        [o2 method];//调用父类方法
        [o3 method];//调用子类重写方法
        
        
    }
    return 0;
}

