//
//  TRViewController.h
//  Day22Chat
//
//  Created by tarena on 14-5-10.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"
@interface TRViewController : UIViewController<AsyncSocketDelegate>
@property (weak, nonatomic) IBOutlet UITextView *myTV;

@end
