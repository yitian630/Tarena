//
//  TRComputer2.h
//  day05-2
//
//  Created by tarena on 14-3-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRCpu2.h"
@interface TRComputer2 : NSObject
{
    TRCpu2* _cpu;
}
//@property(nonatomic,retain)TRCpu2* cpu;
-(void)powerOn;
-(void)start;
-(id)init;
@end



