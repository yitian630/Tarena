//
//  TRBall.m
//  Day18Hitbrick
//
//  Created by tarena on 14-5-5.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRBall.h"

@implementation TRBall

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.offsetX = 4;
        self.offsetY = -4;
        self.layer.cornerRadius = 12.5;
        [NSTimer scheduledTimerWithTimeInterval:1.0/60 target:self selector:@selector(moveBall) userInfo:Nil repeats:YES];
    }
    return self;
}
-(void)moveBall{
    
    self.center = CGPointMake(self.center.x+self.offsetX, self.center.y+self.offsetY);
    
    //墙的判断
    if (self.frame.origin.x>=320-25) {
        self.offsetX = -self.offsetX;
    }
    if (self.frame.origin.y<=0) {
        self.offsetY = -self.offsetY;
    }
    if (self.frame.origin.x<=0) {
        self.offsetX = -self.offsetX;
    }
    
    if (self.frame.origin.y>568) {
        //球死了
    }
}

-(void)changDirection{
    self.offsetY = -self.offsetY;
}

-(void)addSkillByType:(int)skillType{
    switch (skillType) {
        case 1://加速
            self.offsetX*=2;
            self.offsetY*=2;
            break;
        case 2://减速
            self.offsetX/=2;
            self.offsetY/=2;
            break;
            
       
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
