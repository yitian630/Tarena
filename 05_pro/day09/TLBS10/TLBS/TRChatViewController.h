//
//  TRChatViewController.h
//  TLBS
//
//  Created by tarena on 14-4-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRXMPPManager.h"
#import "UserInfo.h"
@interface TRChatViewController : UIViewController<XMPPManagerDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate> 

- (IBAction)backAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *tabBarView;
@property (nonatomic, strong)UserInfo *sendToUserInfo;
- (IBAction)recordButtonAction:(UIButton *)sender;
-(void)sendMessageString:(NSString *)messageString andType:(NSString *)type;
@end
