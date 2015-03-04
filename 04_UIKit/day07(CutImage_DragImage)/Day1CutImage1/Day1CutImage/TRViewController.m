//
//  TRViewController.m
//  Day1CutImage
//
//  Created by tarena on 14-4-9.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic)int count;
@end

@implementation TRViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 60, 100)];
    [self.view addSubview:iv];
    
    [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(runAction:) userInfo:iv repeats:YES];
    
}
-(void)runAction:(NSTimer *)timer{
    UIImageView *iv = timer.userInfo;
    NSLog(@"----");
    
    UIImage *zombImage = [UIImage imageNamed:@"zomb_0.png"];
    
    
//   w/8* 0   w/8*1  w/8*2   w/8*3
//    0-7
    //从整张图片中截取某一部分
    CGImageRef subImage = CGImageCreateWithImageInRect(zombImage.CGImage, CGRectMake(self.count++%8*zombImage.size.width/8, 0, zombImage.size.width/8, zombImage.size.height));
    //    UIImage--》CGImageRef  zombImage.CGImage
    //    CGImageRef-->UIimage
    //    [UIImage imageWithCGImage:subImage]
    iv.image = [UIImage imageWithCGImage:subImage];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
