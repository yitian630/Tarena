//
//  TRDrawView.h
//  Day6DrawLineColor
//
//  Created by tarena on 14-4-16.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRLine.h"
@interface TRDrawView : UIView
@property (nonatomic, strong)NSMutableArray *lines;
@property (nonatomic, strong)NSMutableArray *deleteLines;
@property (nonatomic, strong)UIColor *color;
@property (nonatomic)float width;
@property (nonatomic, strong)TRLine *line;
@end
