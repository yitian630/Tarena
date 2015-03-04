//
//  TRGame.h
//  Day20Game
//
//  Created by tarena on 14-5-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRGame : NSObject
@property (nonatomic)float gameSpeed;
@property (nonatomic, strong)UIView *view;
-(void)gameStart;
-(void)gameover;


@end
