//
//  TRViewController.m
//  Day18Hitbrick
//
//  Created by tarena on 14-5-5.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRBrick.h"
@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIView *myWall;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	 
    [self initUI];
    
    //开始碰撞检测
    [NSTimer scheduledTimerWithTimeInterval:1.0/30 target:self selector:@selector(pengZhuangAction) userInfo:self repeats:YES];
    
}
- (void)pengZhuangAction{
    
    if (CGRectIntersectsRect(self.myWall.frame, self.myBall.frame)) {
        [self.myBall changDirection];
        //如果碰撞上了 需要把球瞬间移除挡板 避免球在挡板间来回碰撞
        self.myBall.frame = CGRectMake(self.myBall.frame.origin.x, self.myWall.frame.origin.y-25, 25, 25);
      
    }
    
    //球和砖块的碰撞
    for (TRBrick *brick in self.view.subviews) {
       
        //判断是砖块
        if ([brick isMemberOfClass:[TRBrick class]]) {
            if (CGRectIntersectsRect(self.myBall.frame, brick.frame)) {
                //如果碰撞 改变球的方向
                [self.myBall changDirection];
                
                self.myBall.frame = CGRectMake(self.myBall.frame.origin.x, brick.frame.size.height+brick.frame.origin.y, 25, 25);
                
                brick.HP--;
                //判断是否有技能
                if (brick.skillType==1||brick.skillType==2) {
                    [self.myBall addSkillByType:brick.skillType];
                }
                if (brick.skillType==3) {
                    self.myWall.frame = CGRectMake(self.myWall.frame.origin.x, self.myWall.frame.origin.y, self.myWall.frame.size.width*1.5, self.myWall.frame.size.height);
                }else  if (brick.skillType==4) {
                    self.myWall.frame = CGRectMake(self.myWall.frame.origin.x, self.myWall.frame.origin.y, self.myWall.frame.size.width/2, self.myWall.frame.size.height);
                }
                
                
            }
            
            
            
        }
    }
    
}
- (void)initUI{
    self.myWall.layer.cornerRadius = 5;
    
    //添加砖块
    for (int i=0; i<40; i++) {
        TRBrick *b = [[TRBrick alloc]initWithFrame:CGRectMake(i%8*40, i/8*25+50, 40, 20)];
//    0-7   0
//    8-15  1

        b.HP = 5-i/8;
        if (i%5==0) {//添加技能
            b.skillType = arc4random()%4+1;
           
        }
        [self.view addSubview:b];
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self.view];
    
    self.myWall.center = CGPointMake(p.x, self.myWall.center.y);
    
    
    CGRect frame = self.myWall.frame;
    if (self.myWall.frame.origin.x<=0) {
        frame.origin.x = 0;
    }else if (self.myWall.frame.origin.x>=320-self.myWall.frame.size.width){
        frame.origin.x = 320-self.myWall.frame.size.width;
    }
    self.myWall.frame = frame;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
