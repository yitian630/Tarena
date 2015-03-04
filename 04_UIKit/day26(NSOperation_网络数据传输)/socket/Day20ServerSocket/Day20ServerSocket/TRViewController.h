//
//  TRViewController.h
//  Day20ServerSocket
//
//  Created by tarena on 14-5-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"
@interface TRViewController : UIViewController<AsyncSocketDelegate>
@property (nonatomic, strong)AsyncSocket *serverSocket;

@end
