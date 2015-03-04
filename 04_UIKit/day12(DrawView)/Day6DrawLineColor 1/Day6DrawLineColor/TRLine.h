//
//  TRLine.h
//  Day6DrawLineColor
//
//  Created by tarena on 14-4-16.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRLine : NSObject
@property (nonatomic, strong)NSMutableArray *points;
@property (nonatomic, strong)UIColor *color;
@property (nonatomic)float width;
@end
