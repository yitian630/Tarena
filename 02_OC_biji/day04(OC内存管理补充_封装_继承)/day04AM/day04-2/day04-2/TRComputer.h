//
//  TRComputer.h
//  day04-2
//
//  Created by tarena on 14-3-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRCpu.h"
#import "TRMem.h"
@interface TRComputer : NSObject
@property(nonatomic,retain)TRCpu* cpu;
@property(nonatomic,retain)TRMem* mem;
-(id)initWithTRCpu:(TRCpu*)cpu andTRMem:(TRMem*)mem;
-(void)playGame;
@end




