//
//  TRGame.h
//  Day20Game
//
//  Created by tarena on 14-5-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRGame : NSObject<UIAlertViewDelegate>
@property (nonatomic)float gameSpeed;
@property (nonatomic, strong)UIView *view;
@property (nonatomic)int scroe;
-(void)gameStart;
-(void)gameover;

+(TRGame *)shareGame;

@end
