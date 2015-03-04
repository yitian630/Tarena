//
//  TRViewController.h
//  Day21HitMouseOnline
//
//  Created by tarena on 14-5-10.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"
@interface TRViewController : UIViewController<AsyncSocketDelegate>
@property (weak, nonatomic) IBOutlet UILabel *successLabel;
@property (weak, nonatomic) IBOutlet UILabel *failCountLabel;
-(void)gameover;
@end
