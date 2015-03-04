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
        //创建dv和iv
        self.dv = [[TRDrawView alloc]initWithFrame:CGRectZero];
        
        self.iv = [[UIImageView alloc]initWithFrame:CGRectZero];
        
        [self addSubview:self.dv];
        [self addSubview:self.iv];
        
        
        self.imagePaths = imagePaths;
        [self initUI];
        
     
        
        [NSTimer scheduledTimerWithTimeInterval:1.0/30 target:self selector:@selector(moveAction) userInfo:Nil repeats:YES];
        
        //添加白色边框
        self.layer.borderWidth = 3;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        
        
        //给photo添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];
        //给photo添加2点手势
        self.multipleTouchEnabled = YES;
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2Action:)];
        [tap2 setNumberOfTouchesRequired:2];
        [self addGestureRecognizer:tap2];
    }
    return self;
}
-(void)tap2Action:(UITapGestureRecognizer*)tap{
    //如果图片变成画图时 tag== 2
    if (self.tag == 1) {
        self.tag = 2;
         self.dv.userInteractionEnabled = YES;
    }else if (self.tag == 2){
        //从画图变为图片时 再重置为1
        self.tag = 1;
         self.dv.userInteractionEnabled = NO;
    }
    CATransition *animation = [CATransition animation];
    animation.type = @"oglFlip";
    animation.subtype = @"fromLeft";
    animation.duration = .8;
    
    [self.layer addAnimation:animation forKey:Nil];
    
    [self exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
}
-(void)tapAction:(UITapGestureRecognizer *)tap{
//做动画显示放大缩小
    [UIView animateWithDuration:.5 animations:^{
        if (self.tag==0) {
            //第一次点击 放大时
            NSLog(@"点击到了图片");
            //保存原来的数据 恢复时要使用
            self.oldAlpha = self.alpha;
            self.oldSpeed = self.speed;
            self.oldFrame = self.frame;
            self.frame = CGRectMake(50, 100, 220, 368);
            self.iv.frame = self.bounds;
            self.dv.frame = self.bounds;
            self.speed = 0;
            self.alpha = 1;
            self.tag = 1;
            //把点击的图片放到最前端
            [self.superview bringSubviewToFront:self];
            
        }else if (self.tag == 1){
            self.speed = self.oldSpeed;
            self.alpha = self.oldAlpha;
            self.frame = self.oldFrame;
            self.dv.frame = self.bounds;
            self.iv.frame = self.bounds;
            self.tag = 0;
        }
    }];
    
}
-(void)initUI{
    float alpha = (arc4random()%6+5)/10.0;
    self.frame = CGRectMake(-50*alpha, arc4random()%(int)(568-80*alpha), 50*alpha, 80*alpha);
    self.speed = alpha*3.0;
    self.alpha = alpha;
    self.dv.frame = self.bounds;
    self.iv.frame = self.bounds;
    
    //从图片路径数组中随机取一张图片显示
    NSString *imagePath = self.imagePaths[arc4random()%self.imagePaths.count];
    self.iv.image = [UIImage imageWithContentsOfFile:imagePath];
    
}
-(void)moveAction{
    self.center = CGPointMake(self.center.x+self.speed, self.center.y);
    
    //离开页面
    if (self.center.x>320+self.bounds.size.width/2) {
        self.center = CGPointMake(-self.bounds.size.width/2, self.center.y);
        [self.dv.lines removeAllObjects];
        [self.dv setNeedsDisplay];
        
        [self initUI];
        
        
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
