//
//  TRPerson.h
//  Day17KVC
//
//  Created by tarena on 14-5-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRPerson : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic)int age;
@property (nonatomic, strong)TRPerson *father;
@end
