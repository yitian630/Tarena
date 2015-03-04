//
//  TRTransportation.h
//  day05-4
//
//  Created by tarena on 14-3-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
enum{Taxi=1,Bus,Bike};
//规则
@interface TRTransportation : NSObject
-(void)print;
//工厂方法 通过不同的数字 不同创建对象
+(TRTransportation*)transportationByNum:(int)num;
@end



