//
//  TRStudent.h
//  day06-7
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject
@property(nonatomic,unsafe_unretained)int age;
@property(nonatomic,weak)NSObject* obj;
-(void)study;
@end


