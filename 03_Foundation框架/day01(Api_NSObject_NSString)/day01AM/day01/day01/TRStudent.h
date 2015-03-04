//
//  TRStudent.h
//  day01
//
//  Created by tarena on 14-3-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBook.h"
@interface TRStudent : NSObject <NSCopying>
@property(nonatomic,unsafe_unretained)int age;
//setter retain->copy
@property(nonatomic,copy)TRBook* book;
-(id)initWithAge:(int)age;

@end




