//
//  TRPoint.h
//  day03-6
//
//  Created by tarena on 14-3-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRPoint : NSObject
@property(nonatomic,assign)int x;
@property(nonatomic,assign)int y;
-(id)initWithX:(int)x andY:(int)y;
+(id)pointWithX:(int)x andY:(int)y;
@end



