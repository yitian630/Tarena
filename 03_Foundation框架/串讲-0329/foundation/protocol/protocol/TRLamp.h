//
//  TRLamp.h
//  protocol
//
//  Created by tarena on 14-3-29.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Light.h"
@interface TRLamp : NSObject
//@property (nonatomic,strong)id<Light> bulb;

-(void)powerOn:(id<Light>)bulb;
@end
