//
//  main.m
//  day06-4
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRTarena2.h"
#import "TRStudent.h"
#import "TRBank.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //一个类是遵守多个协议的
        //多个协议之间用逗号间隔
        id<TRTarena2,TRBank> tp2 = [[TRStudent alloc]init];
        [tp2 learn];
        [tp2 leave];
        [tp2 hk];
    }
    return 0;
}

