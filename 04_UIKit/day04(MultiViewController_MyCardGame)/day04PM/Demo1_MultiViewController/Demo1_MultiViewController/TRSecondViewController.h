//
//  TRSecondViewController.h
//  Demo1_MultiViewController
//
//  Created by tarena on 14-4-2.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRSecondViewController : UIViewController
//接收第一个VC传来的数据
@property (strong, nonatomic)NSString *content;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@end
