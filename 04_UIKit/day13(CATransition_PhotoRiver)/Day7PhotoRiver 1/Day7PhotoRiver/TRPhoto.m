//
//  TRPhoto.m
//  Day7PhotoRiver
//
//  Created by tarena on 14-4-17.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPhoto.h"

@implementation TRPhoto

- (id)initWithFrame:(CGRect)frame andImagePaths:(NSMutableArray *)imagePaths
{
    self = [super initWithFrame:frame];
    if (self) {
        //随机生成透明度 .5-1
        float alpha = (arc4random()%6+5)/10.0;
        self.frame = CGRectMake(-50*alpha, arc4random()%(int)(568-80*alpha), 50*alpha, 80*alpha);
        self.speed = alpha*3.0;
        self.alpha = alpha;
        //创建dv和iv
        self.iv = [[UIImageView alloc]initWithFrame:self.bounds];
        self.dv = [[TRDrawView alloc]initWithFrame:self.bounds];

        [self addSubview:self.dv];
        [self addSubview:self.iv];
       
       
        
        [NSTimer scheduledTimerWithTimeInterval:1.0/30 target:self selector:@selector(moveAction) userInfo:Nil repeats:YES];
        
        //添加白色边框
        self.layer.borderWidth = 3;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        
        //从图片路径数组中随机取一张图片显示
        NSString *imagePath = imagePaths[arc4random()%imagePaths.count];
        self.iv.image = [UIImage imageWithContentsOfFile:imagePath];
    }
    return self;
}
-(void)moveAction{
    self.center = CGPointMake(self.center.x+self.speed, self.center.y);
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
