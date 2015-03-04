//
//  TRPoint.m
//  day03-6
//
//  Created by tarena on 14-3-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPoint.h"

@implementation TRPoint
-(id)initWithX:(int)x andY:(int)y{
    if (self = [super init]) {
        self.x = x;
        self.y = y;
    }
    return self;
}
+(id)pointWithX:(int)x andY:(int)y{
    return [[TRPoint alloc]initWithX:x andY:y];
}
-(NSUInteger)hash{
    return self.x+self.y;
}
-(BOOL)isEqual:(id)object{
    //a.自反性
    if (self==object) {
        return YES;
    }else{
        //b.类型
        if ([object isMemberOfClass:[TRPoint class]]) {
             //c.属性的每一个值是否相同
            TRPoint* p2 = object;
            if ((self.x==p2.x)&&(self.y==p2.y)) {
                return YES;
            }else{
                return NO;
            }
        }else{
            return NO;
        }
    }
    
}
@end





