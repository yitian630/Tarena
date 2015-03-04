//
//  TRViewController.m
//  Day19DragIV
//
//  Created by tarena on 14-5-6.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myIV;

@end

@implementation TRViewController
- (IBAction)panAction:(UIPanGestureRecognizer *)sender {
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            self.beginPoint = [sender locationInView:self.view];
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            CGPoint currentPoint = [sender locationInView:self.view];
            
            float x = currentPoint.x-self.beginPoint.x;
            float y = currentPoint.y-self.beginPoint.y;
            
            self.myIV.center = CGPointMake(self.myIV.center.x+x, self.myIV.center.y+y);
            
            //更新
            self.beginPoint = currentPoint;

            
        }
            
            
            
            
            break;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch *t = [touches anyObject];
//    self.beginPoint = [t locationInView:self.view];
//}
//
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch *t = [touches anyObject];
//    CGPoint currentPoint = [t locationInView:self.view];
//    
//    float x = currentPoint.x-self.beginPoint.x;
//    float y = currentPoint.y-self.beginPoint.y;
//    
//    self.myIV.center = CGPointMake(self.myIV.center.x+x, self.myIV.center.y+y);
//    
//    //更新
//    self.beginPoint = currentPoint;
//    
//    
//    
//    
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
