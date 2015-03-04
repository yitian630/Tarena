//
//  TRPerson.m
//  Day13ArchiverPerson
//
//  Created by tarena on 14-4-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPerson.h"

@implementation TRPerson
- (void)encodeWithCoder:(NSCoder *)aCoder{
    //在对Person进行编码的时候把Person里面的每一个属性进行编码
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.age forKey:@"age"];
    [aCoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
           self.age = [aDecoder decodeIntForKey:@"age"];
           self.phoneNumber = [aDecoder decodeObjectForKey:@"phoneNumber"];
        
        
    }
    
    return self;
}
@end
