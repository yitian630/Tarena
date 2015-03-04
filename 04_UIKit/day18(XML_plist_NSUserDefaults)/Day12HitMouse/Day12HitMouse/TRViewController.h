//
//  TRViewController.h
//  Day12HitMouse
//
//  Created by tarena on 14-4-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *successLabel;
@property (weak, nonatomic) IBOutlet UILabel *failLabel;
-(void)gameover;
@end
