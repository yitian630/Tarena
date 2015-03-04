//
//  TRBook.m
//  day01
//
//  Created by tarena on 14-3-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRBook.h"

@implementation TRBook
-(id)initWithPrice:(float)price{
    if (self = [super init]) {
        self.price = price;
    }
    return self;
}
-(id)copyWithZone:(NSZone *)zone{
    return [[TRBook alloc]initWithPrice:self.price];
}
@end



