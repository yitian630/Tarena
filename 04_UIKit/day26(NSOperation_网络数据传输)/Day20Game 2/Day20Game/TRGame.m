//
//  TRGame.m
//  Day20Game
//
//  Created by tarena on 14-5-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRGame.h"
#import "TRRow.h"
static TRGame *_game;
@implementation TRGame

+(TRGame *)shareGame{
    if (!_game) {
        _game = [[TRGame alloc]init];
    }
    return _game;
}

-(void)gameover{
    //删除页面中所有的行
    for (UIView *v in self.view.subviews) {
        //判断一下子控件如果是Row 就删除之
        if ([v isMemberOfClass:[TRRow class]]) {
            TRRow *r = (TRRow*)v;
            [r remove];
        }
      
    }
    
    
    NSString *info = [NSString stringWithFormat:@"游戏结束 得分%d",self.scroe];
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"提示" message:info delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"重新开始", nil];
    [av show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [self gameStart];
    }
}
- (id)init
{
    self = [super init];
    if (self) {
        self.gameSpeed = 2;
    }
    return self;
}

-(void)gameStart{
    
    for (int i=-1; i<4; i++) {
        TRRow *r = [[TRRow alloc]initWithFrame:CGRectMake(0, i*142, 320, 142)];
        [self.view addSubview:r];
        
    }
    
}
@end
