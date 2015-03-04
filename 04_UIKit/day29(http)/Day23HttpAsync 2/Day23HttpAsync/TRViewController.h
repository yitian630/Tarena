//
//  TRViewController.h
//  Day23HttpAsync
//
//  Created by tarena on 14-5-13.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface TRViewController : UIViewController<NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UIProgressView *myPV;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (nonatomic, strong)AVAudioPlayer *player;
@end
