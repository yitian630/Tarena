//
//  main.m
//  day02-4
//
//  Created by tarena on 14-3-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
/*NSArray*/
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSArray* array1 = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
        NSArray* array2 = [NSArray arrayWithObjects:@"a",@"b", nil];
        //数组的合并
        NSArray* array3 = [array1 arrayByAddingObjectsFromArray:array2];
        //把数组对象添加到数组中
        NSArray* array4 = [array1 arrayByAddingObject:array2];
        NSLog(@"array3:%@",array3);
        NSLog(@"array1 addr:%p",array1);
        NSLog(@"array3 addr:%p",array3);
        NSLog(@"array4:%@",array4);
        //把数组中的内容通过符合连接起来变成字符串
        NSString* arrayString = [array3 componentsJoinedByString:@":"];
        NSLog(@"arrayString:%@",arrayString);
        NSArray* stringArray = [arrayString componentsSeparatedByString:@":"];
        NSLog(@"stringArray:%@",stringArray);
        
        /*
         判断ip:155.155.100.100属于哪个城市？
         第一位 0~100,第二位 0~100 广州
         第一位 101~200,第二位 0~101 北京
         第一位 101~200,第二位 101~200 上海
         */
        /* ***写程序的逻辑 */
        NSString* ip = @"155.155.100.100";
        //把ip地址拆分成数组
        NSArray* ips =[ip componentsSeparatedByString:@"."];
        //得到相应位置的字符串信息
        NSString* str1 = [ips objectAtIndex:0];
        //将字符串信息转换成数值类型
        int ip1 = [str1 intValue];
        NSString* str2 = [ips objectAtIndex:1];
        int ip2 = [str2 intValue];
        //通过关系表达式判断信息的有效性
        if ((ip1>0&&ip1<100)&&(ip2>0&&ip2<100)) {
            NSLog(@"ip地址为广州");
        }else{
            NSLog(@"ip地址非广州");
        }

    }
    return 0;
}

