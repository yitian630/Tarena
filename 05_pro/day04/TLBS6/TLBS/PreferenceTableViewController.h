//
//  PreferenceTableViewController.h
//  TLBS-Project
//
//  Created by 123 on 13-12-25.
//  Copyright (c) 2013年 Wei WenRu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRAppDelegate.h"
@interface PreferenceTableViewController : UITableViewController
- (IBAction)logout:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;

@end
