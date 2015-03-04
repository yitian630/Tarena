//
//  TRCircle.h
//  day04-6
//
//  Created by tarena on 14-3-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRShape.h"

@interface TRCircle : TRShape
@property(nonatomic,assign)float r;
//初始化方法
-(id)initWithR:(float)r;
//工厂方法
+(id)circleWithR:(float)r;
@end





