//
//  TRViewController.m
//  Day5Demo
//
//  Created by tarena on 14-4-15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIView *editView;
@property (weak, nonatomic) IBOutlet UIScrollView *mySV;
@property (nonatomic, strong) UIImageView *dragIV;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //获取文件夹下图片路径
    NSMutableArray *imagePaths = [NSMutableArray array];
    NSString *directoryPath = @"/Users/tarena/Desktop/Photos.localized/照片";
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:directoryPath error:Nil];
    for (NSString *fileName in fileNames) {
        if ([fileName hasSuffix:@"jpg"]) {
            NSString *imagePath = [directoryPath stringByAppendingPathComponent:fileName];
            [imagePaths addObject:imagePath];
        }
    }
    
    
    float x = self.mySV.frame.size.height;
    for (int i=0; i<imagePaths.count; i++) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(i*x, 0, x, x)];
        
        iv.image = [UIImage imageWithContentsOfFile:imagePaths[i]];
        [self.mySV addSubview:iv];
        iv.userInteractionEnabled = YES;
        UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longAction:)];
        [iv addGestureRecognizer:longP];
    }
    [self.mySV setContentSize:CGSizeMake(x*imagePaths.count, 0)];
    
    
}
-(void)longAction:(UILongPressGestureRecognizer *)longPress{
    UIImageView *iv = (UIImageView*)longPress.view;
    CGPoint p = [longPress locationInView:self.view];
   
    switch ((int)longPress.state) {
        case UIGestureRecognizerStateBegan:
      //复制一个IV 和点击的一模一样
            self.dragIV = [[UIImageView alloc]initWithFrame:iv.frame];
            self.dragIV.image = iv.image;
            [self.view addSubview:self.dragIV];
     
            break;
            
        case UIGestureRecognizerStateChanged:
            
            //实现拖动
            self.dragIV.center = p;
            break;
        case UIGestureRecognizerStateEnded:
            //判断是否在编辑区送的手
            if (self.dragIV) {
                if (CGRectContainsPoint(self.editView.frame, p)) {
                    CGPoint newCenter = [self.view convertPoint:self.dragIV.center toView:self.editView];
                    
                    [self.editView addSubview:self.dragIV];
                    self.dragIV.center = newCenter;
                }else{
                    [self.dragIV removeFromSuperview];
                }
                
                
            }
            break;
    }
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
