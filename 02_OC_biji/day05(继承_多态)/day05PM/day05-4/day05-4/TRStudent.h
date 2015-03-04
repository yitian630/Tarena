//
//  TRStudent.h
//  day05-4
//
//  Created by tarena on 14-3-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRTransportation.h"
@interface TRStudent : NSObject
@property(nonatomic,assign)int age;
-(void)gotoSchoolByTransportation:(TRTransportation*)tran;
@end



