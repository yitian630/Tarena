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
@property (weak, nonatomic) IBOutlet UIImageView *bgIV;
@property (nonatomic, strong) UIImageView *dragIV;
@property (nonatomic, strong)UIImageView *editBgIV;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //获取文件夹下图片路径
    NSMutableArray *imagePaths = [NSMutableArray array];
    NSString *directoryPath = @"/Users/tarena/Desktop/美女/范冰冰";
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
                    //添加各种手势
                    [self addGesture];
                    
                    
                }else if(CGRectContainsPoint(self.bgIV.frame, p)){
                    self.bgIV.image = self.dragIV.image;
                  
//                    往编辑区添加背景图片
                    if (!self.editBgIV) {
                         self.editBgIV = [[UIImageView alloc]initWithFrame:self.editView.bounds];
                             //把控件插入到某一个位置 0 为最底下
                          [self.editView insertSubview:self.editBgIV atIndex:0];
                    }
                   
                    self.editBgIV.image = self.dragIV.image;
               
                  
                    
                      [self.dragIV removeFromSuperview];
                    
                }else{
                    [self.dragIV removeFromSuperview];
                }
                
                
            }
            break;
    }
    
   
}

-(void)addGesture{
    self.dragIV.userInteractionEnabled = YES;
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationAction:)];
    [self.dragIV addGestureRecognizer:rotation];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    
    [self.dragIV addGestureRecognizer:pan];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchAction:)];
    
    [self.dragIV addGestureRecognizer:pinch];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.dragIV addGestureRecognizer:tap];
    
}
-(void)tapAction:(UITapGestureRecognizer*)tap{
    //把某一个子视图带到前端
    [self.editView bringSubviewToFront:tap.view];
}
- (void)pinchAction:(UIPinchGestureRecognizer *)sender {
    //通过手势得到图片
    UIImageView *iv = (UIImageView*)sender.view;
    //通过transform进行缩放
    [iv setTransform:CGAffineTransformScale(iv.transform, sender.scale, sender.scale)];
    //更新状态
    sender.scale = 1;
    NSLog(@"%f",sender.scale);
}

- (void)rotationAction:(UIRotationGestureRecognizer *)sender {
    UIImageView *iv = (UIImageView*)sender.view;
    [iv setTransform:CGAffineTransformRotate(iv.transform, sender.rotation)];
    //更新状态
    sender.rotation = 0;
}


- (void)panAction:(UIPanGestureRecognizer *)sender {
    UIImageView *iv = (UIImageView*)sender.view;
    CGPoint p = [sender locationInView:self.editView];
    //区分究竟是哪种状态
    switch ((int)sender.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
            
        case UIGestureRecognizerStateChanged:
            iv.center = p;
            break;
        case UIGestureRecognizerStateEnded:
            
            break;
        case UIGestureRecognizerStateCancelled:
            
            break;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
