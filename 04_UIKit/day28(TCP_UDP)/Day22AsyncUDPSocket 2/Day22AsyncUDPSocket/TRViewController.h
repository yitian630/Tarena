//
//  TRViewController.h
//  Day22AsyncUDPSocket
//
//  Created by tarena on 14-5-12.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncUdpSocket.h"
@interface TRViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UITextField *sendInfoTF;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UITableView *ipsTableView;
@property (weak, nonatomic) IBOutlet UITextView *myTV;
- (IBAction)mySwichChangeAction:(id)sender;

@end
