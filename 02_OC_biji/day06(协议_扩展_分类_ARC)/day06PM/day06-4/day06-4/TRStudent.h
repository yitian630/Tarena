//
//  TRStudent.h
//  day06-4
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRTarena2.h"
#import "TRBank.h"
@interface TRStudent : NSObject <TRTarena2,TRBank>
-(void)study;
@end
