//
//  TRPerson.h
//  Day13ArchiverPerson
//
//  Created by tarena on 14-4-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRPerson : NSObject<NSCoding>
@property (nonatomic, copy)NSString *name;
@property (nonatomic)int age;
@property (nonatomic, copy)NSString *phoneNumber;
@end
