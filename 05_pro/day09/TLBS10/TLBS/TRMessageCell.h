//
//  TRMessageCell.h
//  TLBS
//
//  Created by tarena on 14-4-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMPP.h"
#import "TRTextView.h"
#import <AVFoundation/AVFoundation.h>
@interface TRMessageCell : UITableViewCell
@property (nonatomic, strong)XMPPMessage *message;
@property (nonatomic, strong)TRTextView *textView;
@property (strong, nonatomic) UIImageView *myImageView;
@property (nonatomic, weak)UIViewController *delegate;
@property (nonatomic, strong) AVAudioPlayer *player;
@end
