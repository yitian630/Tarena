//
//  main.m
//  day03-7
//
//  Created by tarena on 14-3-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
/*NSDictionary*/
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //创建一个键值对的字典集合
        NSMutableDictionary* dic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"4",@"four",@"3",@"three",@"2",@"two",@"1",@"one",@"3",@"five", nil];
        NSLog(@"dic:%@",dic);
        //添加一个元素
        [dic setValue:@"6" forKey:@"six"];
        NSLog(@"dic:%@",dic);
        //通过key值得到数组中的对应value值
        NSString* value = [dic objectForKey:@"three"];
        NSLog(@"key:three->value:%@",value);
        //得到字典中所有的keys
        NSArray* allkeys = [dic allKeys];
        //遍历字典?
        for (NSString* key in allkeys) {
            NSString* value = [dic objectForKey:key];
            NSLog(@"key:%@->value:%@",key,value);
        }
    }
    return 0;
}

