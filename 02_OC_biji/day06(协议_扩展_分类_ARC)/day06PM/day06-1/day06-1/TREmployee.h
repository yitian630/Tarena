//
//  TREmployee.h
//  day06-1
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TREmployee : NSObject
@property(nonatomic,assign)float salary;
@property(nonatomic,copy)NSString* job;
@property(nonatomic,copy)NSString* name;
-(void)print;
+(TREmployee*)HRByNum:(int) num;
@end




