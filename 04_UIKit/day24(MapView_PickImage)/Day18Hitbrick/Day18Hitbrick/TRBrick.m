//
//  TRBrick.m
//  Day18Hitbrick
//
//  Created by tarena on 14-5-5.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRBrick.h"

@implementation TRBrick

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
 
    if (self) {
        self.layer.cornerRadius = 3;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor blackColor].CGColor;
    }
    return self;
}
-(void)setHP:(int)HP{
    _HP = HP;
    UIColor *c = Nil;
    switch (HP) {
        case 0:
            [self dead];
            break;
        case 1:
            c = [UIColor whiteColor];
            break;
            
        case 2:
             c = [UIColor yellowColor];
            break;
        case 3:
             c = [UIColor greenColor];
            break;
        case 4:
             c = [UIColor blueColor];
            break;
        case 5:
             c = [UIColor redColor];
            break;
    }
    self.backgroundColor = c;
}

-(void)setSkillType:(int)skillType{
    _skillType = skillType;
    switch (skillType) {
        case 1:
             self.text = @"加速";
            break;
        case 2:
            self.text = @"减速";
            break;
        case 3:
            self.text = @"变宽";
            break;
        case 4:
            self.text = @"变窄";
            break;
    }
    
}
-(void)dead{
    [self removeFromSuperview];
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
