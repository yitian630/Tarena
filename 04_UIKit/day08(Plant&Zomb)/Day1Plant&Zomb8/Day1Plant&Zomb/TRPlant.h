//
//  TRPlant.h
//  Day1Plant
//
//  Created by tarena on 14-4-9.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRViewController.h"
@interface TRPlant : UIImageView
@property (nonatomic)int count;
@property (nonatomic, strong)UIImage *plantImage;
@property (nonatomic) int fps;
@property (nonatomic, weak)TRViewController *vc;
-(void)fire;
-(void)changeImage;
@end
