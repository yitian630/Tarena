//
//  RecordButton.h
//  TLBS
//
//  Created by tarena on 14-4-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "lame.h"

@interface RecordButton : UIButton
@property (nonatomic, strong)AVAudioRecorder *recorder;
@property (nonatomic, strong)AVAudioPlayer *player;
@end
