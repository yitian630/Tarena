//
//  TRViewController.m
//  Day1MoveNewImage
//
//  Created by tarena on 14-4-9.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *sunIV;
@property (nonatomic, strong)UIImageView *dragIV;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self.view];
    if (CGRectContainsPoint(self.sunIV.frame, p)) {
        //创建一个新的图片
        self.dragIV = [[UIImageView alloc]initWithFrame:self.sunIV.frame];
        self.dragIV.image = self.sunIV.image;
        [self.view addSubview:self.dragIV];
        
        
        
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self.view];
    self.dragIV.center = p;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
