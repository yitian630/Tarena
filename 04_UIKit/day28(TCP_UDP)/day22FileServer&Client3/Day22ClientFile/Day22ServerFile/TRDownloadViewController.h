//
//  TRDownloadViewController.h
//  Day22ServerFile
//
//  Created by tarena on 14-5-12.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRFile.h"
#import "AsyncSocket.h"
@interface TRDownloadViewController : UIViewController<AsyncSocketDelegate>
@property (nonatomic, strong)TRFile *downloadFile;
@end
