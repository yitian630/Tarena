//
//  main.m
//  day02-1
//
//  Created by tarena on 14-3-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
/*NSNumber*/
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        int i = 10;//基本数据类型
        //封装成引用数据类型
        NSNumber* number = [NSNumber numberWithInt:i];
        NSLog(@"number:%@",number);
        //解封
        int i2 = [number intValue];
        NSLog(@"i2:%d",i2);
        
        //NSValue
        //定义结构体类型
        typedef struct _Point2{
            int x;
            int y;
        }Point2;
        //使用
        Point2 point;
        point.x = 10;
        point.y = 20;
        //转换成NSValue对象
        //参数1 结构体变量的内存地址
        //参数2 具体的结构体类型
        //封装
        NSValue* value = [NSValue value:&point withObjCType:@encode(Point2)];
        NSLog(@"value:%@",value);
        //解封
        //声明一个新的变量 保存解封后的数值
        Point2 point2;
        [value getValue:&point2];
        NSLog(@"point2 x:%d",point2.x);
        NSLog(@"point2 y:%d",point2.y);
        
        
    }
    return 0;
}




