//
//  TRSecondViewController.h
//  Day4Storyboard2
//
//  Created by tarena on 14-4-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRViewController.h"
@interface TRSecondViewController : UIViewController
@property (nonatomic, weak)TRViewController *firstVC;
@property (nonatomic, copy)NSString *str;
@end
