//
//  TRStudent.m
//  day05-4
//
//  Created by tarena on 14-3-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
//多态可以用做参数
-(void)gotoSchoolByTransportation:(TRTransportation *)tran{
    NSLog(@"stu age:%d gotoSchoolByTransportation:",self.age);
    [tran print];
}
@end




