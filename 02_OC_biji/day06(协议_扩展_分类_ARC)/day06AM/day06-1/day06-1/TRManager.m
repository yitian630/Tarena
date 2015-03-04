//
//  TRManager.m
//  day06-1
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRManager.h"

@implementation TRManager
-(id)initWithName:(NSString *)name andJob:(NSString*)job andSalary:(float)salary{
    self = [super init];
    if (self) {
        self.name = name;
        self.job = job;
        self.salary = salary+2000;
    }
    return self;
}
-(void)print{
    NSLog(@"领导的信息 姓名:%@ job:%@ salary:%f",self.name,self.job,self.salary);
}
@end
