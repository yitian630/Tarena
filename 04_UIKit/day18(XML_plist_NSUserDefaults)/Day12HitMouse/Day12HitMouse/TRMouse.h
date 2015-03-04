//
//  TRMouse.h
//  Day12HitMouse
//
//  Created by tarena on 14-4-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRViewController.h"
@interface TRMouse : UIButton
@property (nonatomic, weak)TRViewController *delegate;
@property (nonatomic, strong)NSTimer *timer;
@end
