//
//  TRStaff.m
//  day06-1
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRStaff.h"

@implementation TRStaff
-(id)initWithName:(NSString *)name andJob:(NSString*)job andSalary:(float)salary{
    self = [super init];
    if (self) {
        self.name = name;
        self.job = job;
        self.salary = salary;
    }
    return self;
}
@end


