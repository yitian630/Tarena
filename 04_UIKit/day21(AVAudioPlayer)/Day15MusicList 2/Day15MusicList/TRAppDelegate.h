//
//  TRAppDelegate.h
//  Day15MusicList
//
//  Created by tarena on 14-4-29.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface TRAppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong)AVAudioPlayer *player;
//strong的set方法 把原来的值release 把新的值retain   [_player release];   [newPlayer retain]
//_player = newPlayer;

//weak的set方法 _player = newPlayer;
@property (strong, nonatomic) UIWindow *window;

@end
