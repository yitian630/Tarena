//
//  main.m
//  day01-3
//
//  Created by tarena on 14-3-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
/*NSString*/
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSString* str = @"hello";
        NSString* str2 = @"hello";
        NSLog(@"str addr:%p",str);
        NSLog(@"str2 addr:%p",str2);
        NSString* str3 = [NSString stringWithFormat:@"%@ world",str];
        NSLog(@"str3:%@",str3);
        NSString* str4 = [NSString stringWithFormat:@"%@",str];
        NSLog(@"str4 addr:%p",str4);
        //通过文件的内容创建字符串
        NSString* str5 = [NSString stringWithContentsOfFile:@"/Users/tarena/Desktop/test2"];
        //参数1 文件路径
        //参数2 编码格式
        //参数3 异常处理(nil)
        NSString* str6 = [NSString stringWithContentsOfFile:@"/Users/tarena/Desktop/test2" encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"str5:%@",str5);
        NSLog(@"str6:%@",str6);
        
        NSString* str7 = @"hello2";
        NSString* str8 = [NSString stringWithFormat:@"%@",str7];
        //判断两个字符是否是相等的
        BOOL strE = [str7 isEqualToString:str8];
        if (strE) {
            NSLog(@"两个字符是相等的");
        }else{
            NSLog(@"两个字符是不相等的");
        }
        
        NSString* str9 = @"abc";
        NSString* str10 = @"bbc";
        NSComparisonResult cr = [str9 compare:str10];
        if (cr==NSOrderedSame) {
            NSLog(@"两个字符串是相等的");
        }else if (cr==NSOrderedAscending){
            NSLog(@"第一个字符串比第二个字符串小");
        }else{
            NSLog(@"第一个字符串比第二个字符串大");
        }
        
        NSString* str11 = @"ABC";
        NSString* str12 = @"abc";
        NSComparisonResult cr2 = [str11 caseInsensitiveCompare:str12];
        //NSLog(@"cr2:%d",cr2);
        if (cr2==0) {
            NSLog(@"验证码是相同的");
        }
        
        //可变字符串NSMutableString
        NSMutableString* str13 = [[NSMutableString alloc]init];
        [str13 insertString:@"abc" atIndex:0];//插入 添加
        NSLog(@"str13:%@",str13);//abc
        [str13 insertString:@"123" atIndex:1];
        NSLog(@"str13:%@",str13);//a123bc
        //替换的内容 参数1 位置 参数2 长度
        NSRange range = {1,3};//结构体
        //替换字符串的内容 修改
        [str13 replaceCharactersInRange:range withString:@"abc"];
         NSLog(@"str13:%@",str13);//aabcbc
        NSRange range2 = {2,2};
        [str13 deleteCharactersInRange:range2];//删除字符串
        NSLog(@"str13:%@",str13);
    }
    return 0;
}





