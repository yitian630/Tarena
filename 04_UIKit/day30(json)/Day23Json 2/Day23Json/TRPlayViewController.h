//
//  TRPlayViewController.h
//  Day23Json
//
//  Created by tarena on 14-5-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface TRPlayViewController : UIViewController<NSURLConnectionDataDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, copy)NSString *songID;
@end
