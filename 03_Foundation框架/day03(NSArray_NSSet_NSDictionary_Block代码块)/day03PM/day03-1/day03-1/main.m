//
//  main.m
//  day03-1
//
//  Created by tarena on 14-3-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSString* str = @"four";
        
        NSMutableArray* array2 = [NSMutableArray arrayWithObjects:@"one",@"two",@"three",@"four", nil];
        NSLog(@"array2:%@",array2);
        /*替换指定下标的元素
        参数1 下标 参数2 替换的内容*/
        [array2 replaceObjectAtIndex:1 withObject:@"2"];
        NSLog(@"array2:%@",array2);
    }
    return 0;
}

