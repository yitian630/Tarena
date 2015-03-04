//
//  TRComputer3.h
//  day05-2
//
//  Created by tarena on 14-3-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRcpu3.h"
@interface TRComputer3 : NSObject
@property(nonatomic,retain)TRcpu3* cpu;
-(void)powerOn;
-(void)start;
@end



