//
//  TRViewController.m
//  Day7ChangeImage
//
//  Created by tarena on 14-4-17.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mySV;
@property (nonatomic)int index;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    for (int i=0; i<5; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",i];
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(i*320, 0, 320, self.view.bounds.size.height)];
        iv.image = [UIImage imageNamed:imageName];
        [self.mySV addSubview:iv];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeImageAction) userInfo:Nil repeats:YES];
    
    
}
-(void)changeImageAction{
    //     fade moveIn  push  reveal
    //    cube suckEffect oglFlip rippleEffect pageCurl pageUnCurl cameraIrisHollowOpen cameraIrisHollowClose
    NSArray *typeArr = @[@"pageCurl",@"rippleEffect",@"oglFlip",@"cube",@"suckEffect"];
    
    CATransition *animation = [CATransition animation];
    animation.type = typeArr[arc4random()%typeArr.count];
    animation.subtype = @"fromLeft";
    animation.duration = 1;
    animation.delegate = self;
    [self.mySV.layer addAnimation:animation forKey:Nil];
    [self.mySV setContentOffset:CGPointMake(320*(++self.index%5), 0)];
}


- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"动画开始");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
      NSLog(@"动画结束");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
