//
//  TRViewController.m
//  Day5TouchEvent
//
//  Created by tarena on 14-4-15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic, strong)UIImageView *iv;
@property (nonatomic)float oldDis;
@property (nonatomic)CGPoint oldCenter;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.iv = [[UIImageView alloc]initWithFrame:CGRectMake(150, 120, 100, 100)];
    self.iv.image = [UIImage imageNamed:@"j0308903.jpg"];
    self.iv.center = CGPointMake(160, 240);
	[self.view addSubview:self.iv];
}
//如果想使用多点的话 需要让控件开启多点交互
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (touches.count == 2) {
        NSArray *newTouches = [touches allObjects];
        UITouch *t1 = newTouches[0];
        UITouch *t2 = newTouches[1];
        CGPoint p1 = [t1 locationInView:self.view];
        CGPoint p2 = [t2 locationInView:self.view];
//        NSLog(@"p1 x=%f y=%f p2 x=%f y=%f",p1.x,p1.y,p2.x,p2.y);
        //记录原来的两点见的距离    
        self.oldDis = sqrtf((p2.x-p1.x)*(p2.x-p1.x)+(p2.y-p1.y)*(p2.y-p1.y));
        NSLog(@"%f",self.oldDis);
        //记录原来的中心点 放大时以中心点为基准
        self.oldCenter = self.iv.center;
    }

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if (touches.count == 2) {
        NSArray *newTouches = [touches allObjects];
        UITouch *t1 = newTouches[0];
        UITouch *t2 = newTouches[1];
        CGPoint p1 = [t1 locationInView:self.view];
        CGPoint p2 = [t2 locationInView:self.view];
        //        NSLog(@"p1 x=%f y=%f p2 x=%f y=%f",p1.x,p1.y,p2.x,p2.y);
//        old  = 50
//        current = 100
//        current = 150
        float currentDis = sqrtf((p2.x-p1.x)*(p2.x-p1.x)+(p2.y-p1.y)*(p2.y-p1.y));
        float scale = currentDis/self.oldDis;
        //更新一下两点间的距离
        self.oldDis = currentDis;
        NSLog(@"scale = %f",scale);
        
        self.iv.frame = CGRectMake(self.iv.frame.origin.x, self.iv.frame.origin.y, self.iv.frame.size.width*scale, self.iv.frame.size.height*scale);
        self.iv.center = self.oldCenter;
    }
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
