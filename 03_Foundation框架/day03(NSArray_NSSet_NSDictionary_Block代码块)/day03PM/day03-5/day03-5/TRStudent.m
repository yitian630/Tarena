//
//  TRStudent.m
//  day03-5
//
//  Created by tarena on 14-3-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
//-(BOOL)isEqual:(id)object
//{
//   if (self==object) {
//      return YES;
//   }else{
//      if ([object isMemberOfClass:[TRStudent class]]) {
//         TRStudent* stu2 = object;
//            if ([self.name isEqualToString:stu2.name]) {
//               return YES;
//            }else{
//               return NO;
//            }
//      }
//      return NO;
//   }
//}
//方法返回值为1时证明两个对象是重复的
-(BOOL)isEqual:(id)object{
    if (self==object) {//a.自反性
        return YES;//相同
    }else{//有可能相同  //b.类型
        if ([object isMemberOfClass:[TRStudent class]]) {
            TRStudent* stu2 = object;
            //有可能相同 比较对象中的所有属性值    //c.所有属性值
           
                if ([self.name isEqualToString:stu2.name]) {
                    return YES;
                }else{
                    return NO;
                }
           
          
            
        }else{
            return NO;//不同
        }
    }
}
//计算机认为的重复满足不了我们的生活需要
//如果hash值相同 证明两个对象有可能相同
//并继续自动执行isEqaul方法
-(NSUInteger)hash{
    NSLog(@"hash:%d",self.age);
    return self.age;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"age:%d name:%@",self.age,self.name];
}
@end







