//
//  TRPea.m
//  Day1Plant
//
//  Created by tarena on 14-4-9.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPea.h"

@implementation TRPea

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.plantImage = [UIImage imageNamed:@"plant_2.png"];
        self.bullets = [NSMutableArray array];
        self.bulletImage = [UIImage imageNamed:@"bullet_0.png"];
    }
    return self;
}
-(void)fire{
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addBullet) userInfo:nil repeats:YES];
}
-(void)addBullet{
    UIImageView *bulletIV = [[UIImageView alloc]initWithFrame:CGRectMake(self.superview.frame.origin.x+35, self.superview.frame.origin.y+5, 15, 15)];
    bulletIV.image = self.bulletImage;
    [self.vc.view addSubview:bulletIV];
    [self.bullets addObject:bulletIV];
}

-(void)changeImage{
    
    [super changeImage];
    
    
    //移动子弹的代码
    for (UIImageView *bulletIV in self.bullets) {
        bulletIV.center = CGPointMake(bulletIV.center.x+2, bulletIV.center.y);
        
        if (bulletIV.center.x>=576) {
            [bulletIV removeFromSuperview];
            [self.bullets removeObject:bulletIV];
            //forin循环过程中如果修改了数组 需要跳出循环
            break;
        }
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
