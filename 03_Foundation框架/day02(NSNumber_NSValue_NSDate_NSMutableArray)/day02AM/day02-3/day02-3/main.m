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
        NSArray* array3 = [NSArray arrayWithObjects:@"one",@"two",@"three", nil];
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
    }
    return 0;
}

