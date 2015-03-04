//
//  TRbrick.m
//  Day20Game
//
//  Created by tarena on 14-5-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRbrick.h"
#import "TRGame.h"
@implementation TRbrick

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [UIColor darkGrayColor].CGColor;
        self.layer.borderWidth = 1;
        [self addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)clicked{
    TRGame *game = [TRGame shareGame];
    if (self.isBlack) {
        game.scroe++;
        game.gameSpeed+=.2;
        self.isBlack = NO;
        self.backgroundColor = [UIColor grayColor];
    }else{
        [game gameover];
    }
    
}

-(void)setIsBlack:(BOOL)isBlack{
    _isBlack = isBlack;
    if (isBlack) {
        self.backgroundColor = [UIColor blackColor];
    }else{
        self.backgroundColor = [UIColor whiteColor];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
