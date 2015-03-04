//
//  main.m
//  day06-2
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPerson.h"
//#import "TRPerson+TREquipment.h"
#import "NSString+TRConnectionServer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //给自定义类添加能力
        TRPerson* person = [[TRPerson alloc]init];
        person.age = 20;
        //person.age = 18;
        [person fly];
        [person addSpider];
        //给系统类添加能力
        NSString* str = [[NSString alloc]init];
        [str conection];
        
    }
    return 0;
}

