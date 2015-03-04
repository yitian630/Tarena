//
//  TRViewController.m
//  Day1DragImage
//
//  Created by tarena on 14-4-9.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UILabel *rightCountLabel;
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UILabel *leftCountLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *bullets;
@property (nonatomic, strong)UIImageView *dragView;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self.view];
    for (UIImageView *bulletIV in self.bullets) {
        if (CGRectContainsPoint(bulletIV.frame, p)) {
            
            self.dragView = [[UIImageView alloc]initWithFrame:bulletIV.frame];
            self.dragView.image = bulletIV.image;
            [self.view addSubview:self.dragView];
        }
        
        
    }
    
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self.view];
    self.dragView.center = p;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self.view];
    
    if (self.dragView) {
        if (CGRectContainsPoint(self.leftView.frame, p)) {
            //什么时候用到坐标转换 当控件的父视图发生改变的时候
           CGPoint newCenter = [self.view convertPoint:self.dragView.center toView:self.leftView];
            
            [self.leftView addSubview:self.dragView];
            self.dragView.center = newCenter;
            
            
            //现在是在左边松手了 需要左边的label+1
            int count = [self.leftCountLabel.text intValue];
            self.leftCountLabel.text = [NSString stringWithFormat:@"%d",++count];
        }else if (CGRectContainsPoint(self.rightView.frame, p)){
            
            CGPoint newCenter = [self.view convertPoint:self.dragView.center toView:self.rightView];
            
            [self.rightView addSubview:self.dragView];
            self.dragView.center = newCenter;
            
            
            int count = [self.rightCountLabel.text intValue];
            self.rightCountLabel.text = [NSString stringWithFormat:@"%d",++count];
        }else{
            [self.dragView removeFromSuperview];
        }
        self.dragView = Nil;
    }
}
//控件有一个clip subViews属性 如果打钩  意思是超出自身控件范围的子控件部分不显示
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
