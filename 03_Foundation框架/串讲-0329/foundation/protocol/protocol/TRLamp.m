//
//  TRLamp.m
//  protocol
//
//  Created by tarena on 14-3-29.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRLamp.h"

@implementation TRLamp
-(void)powerOn:(id<Light>)bulb {
    [bulb lighting];
}
@end
