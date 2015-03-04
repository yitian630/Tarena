//
//  TRViewController.m
//  Demo1_UIScrollView
//
//  Created by tarena on 14-4-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation TRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"Galaxy.jpg"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    self.imageView = imageView;
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    //内容
    [scrollView addSubview:imageView];
    //frame
    scrollView.frame = self.view.frame;
    //内容的大小
    scrollView.contentSize = imageView.frame.size;
    
    //一些其他的属性
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    //在iOS7中一般不用
    //scrollView.contentInset = UIEdgeInsetsMake(44, 5, 5, 5);
    
    //缩放的属性
    float horizontalScale = scrollView.frame.size.width / imageView.frame.size.width;
    float verticalScale = scrollView.frame.size.height / imageView.frame.size.height;
    
    scrollView.minimumZoomScale = MIN(horizontalScale, verticalScale);
    scrollView.maximumZoomScale = 1.0;
    
    scrollView.delegate = self;
    
    [self.view addSubview:scrollView];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
