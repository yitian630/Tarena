//
//  TRPlayerViewController.h
//  Day14Team&Player
//
//  Created by tarena on 14-4-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Team.h"
@interface TRPlayerViewController : UITableViewController<UIAlertViewDelegate>
@property (nonatomic, strong)Team *team;
@end
