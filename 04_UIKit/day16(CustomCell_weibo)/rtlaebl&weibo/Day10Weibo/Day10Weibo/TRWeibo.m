//
//  TRWeibo.m
//  Day9CustomTableHeaderView
//
//  Created by tarena on 14-4-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRWeibo.h"
#import "RTLabel.h"
@implementation TRWeibo
-(float)weiboHeight{
    
    RTLabel *label = [[RTLabel alloc]initWithFrame:CGRectMake(0, 0, 206, 0)];
    label.text = self.text;
    
    return label.optimumSize.height;
}
@end
