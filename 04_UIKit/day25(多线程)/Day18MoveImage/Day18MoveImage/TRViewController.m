//
//  TRViewController.m
//  Day18MoveImage
//
//  Created by tarena on 14-5-5.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mySV;
@property (nonatomic, strong)NSMutableArray *ivs;
@property (nonatomic)int from;
@property (nonatomic)int to;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ivs = [NSMutableArray array];
	NSString *appPath = [[NSBundle mainBundle]resourcePath];
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSMutableArray *imagePaths = [NSMutableArray array];
    
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:appPath error:Nil];
    
    for (NSString *fileName in fileNames) {
        if ([fileName hasSuffix:@"jpg"]) {
            NSString *imagePath = [appPath stringByAppendingPathComponent:fileName];
            
            [imagePaths addObject:imagePath];
        }
    }
    
    for (int i=0; i<imagePaths.count; i++) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(i%4*80, i/4*80, 80, 80)];
        iv.image = [UIImage imageWithContentsOfFile:imagePaths[i]];
        [self.mySV addSubview:iv];
        //给图片添加手势
        UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longAction:)];
        //让控件记录自己的位置
        iv.tag = i;
        [iv addGestureRecognizer:longP];
        iv.userInteractionEnabled = YES;
        [self.ivs addObject:iv];
    }
}

-(void)longAction:(UILongPressGestureRecognizer *)longP{
    //拿到点击到的图片
    UIImageView *dragView = (UIImageView*)longP.view;
    CGPoint p = [longP locationInView:self.view];
    dragView.center = p;
    [self.mySV bringSubviewToFront:dragView];
    
    //把点击到的图片从数组中删除
    [self.ivs removeObject:dragView];
    
    self.from = dragView.tag;
    
    
    for (UIImageView *iv in self.ivs) {
        if (CGRectContainsPoint(iv.frame, p)) {
            self.to = iv.tag;
            [self.ivs insertObject:dragView atIndex:self.to];
            
            [self updateUI];
            
            break;
        }
    }
    
    
    
    if (longP.state == UIGestureRecognizerStateEnded) {
        //松手时把当前拖动的图片添加到它该在的地方
        [self.ivs insertObject:dragView atIndex:dragView.tag];
        //松手时避免更新位置的时候仍然把当前拖动的图片过滤掉 所以让to=-1 
        self.to = -1;
        [self updateUI];
    }
}


-(void)updateUI{
    for (int i=0; i<self.ivs.count; i++) {
        UIImageView *iv = self.ivs[i];
        //跟新自己最新的位置
        iv.tag = i;
        
        
        if (i==self.to) {
//            如果是当前正在拖动的图片就不做动画
            continue;
        }
      
        [UIView animateWithDuration:.3 animations:^{
            iv.frame = CGRectMake(i%4*80, i/4*80, 80, 80);
        }];
        
     
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
