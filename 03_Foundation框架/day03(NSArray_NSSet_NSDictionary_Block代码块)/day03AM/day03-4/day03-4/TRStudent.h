//
//  TRStudent.h
//  day03-4
//
//  Created by tarena on 14-3-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject
@property(nonatomic,assign)int age;
@property(nonatomic,copy)NSString* name;
-(NSComparisonResult)compareStudent:(TRStudent*)stu2;
-(NSComparisonResult)compareStudentAge:(TRStudent *)stu2;
@end





