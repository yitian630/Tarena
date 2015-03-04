//
//  TRTransportation.m
//  day05-4
//
//  Created by tarena on 14-3-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRTransportation.h"
#import "TRBus.h"
#import "TRBike.h"
#import "TRTaxi.h"

@implementation TRTransportation
+(TRTransportation *)transportationByNum:(int)num{
    switch (num) {
        case Taxi:
            return [[TRTaxi alloc]init];
            break;
        case Bus:
            return [[TRBus alloc]init];
            break;
        case Bike:
            return [[TRBike alloc]init];
            break;
        default:NSLog(@"输入数据有误!");
    }
    return Nil;
}
-(void)print{
    NSLog(@"交通工具");
}
@end



