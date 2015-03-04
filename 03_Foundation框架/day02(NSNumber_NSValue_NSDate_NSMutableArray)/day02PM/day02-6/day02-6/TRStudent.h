//
//  TRStudent.h
//  day02-3
//
//  Created by tarena on 14-3-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject
@property(nonatomic,assign)int age;
@property(nonatomic,copy)NSString* name;
-(id)initWithAge:(int)age andName:(NSString*)name;
+(id)studentWithAge:(int)age andName:(NSString*)name;
@end



