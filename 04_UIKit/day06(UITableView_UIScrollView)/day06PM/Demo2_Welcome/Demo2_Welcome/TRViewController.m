//
//  TRViewController.m
//  Demo2_Welcome
//
//  Created by tarena on 14-4-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController () <UIScrollViewDelegate>
@property (strong, nonatomic)UIPageControl *pageControl;
@end

@implementation TRViewController

- (NSArray *)imageNames
{
    if (!_imageNames) {
        _imageNames = @[@"Welcome1@2x.jpg",@"Welcome2@2x.jpg",@"Welcome3@2x.jpg",@"Welcome4@2x.jpg",@"Welcome5@2x.jpg"];
    }
    return _imageNames;
}

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
    /*
        self.view
            +scrollView
                +imageViews
                    +image
                +enterButton
            +pageControl
     */
    //创建scrollView,并设置frame
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.frame;
    
    //加多个子视图imageView到scrollView
    for(int i=0; i<self.imageNames.count; i++){
        UIImage *image = [UIImage imageNamed:self.imageNames[i]];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        float x = i * scrollView.frame.size.width;
        CGRect frame = CGRectZero;
        frame.origin.x = x;
        frame.origin.y = 0;
        frame.size = scrollView.frame.size;
        imageView.frame = frame;
        [scrollView addSubview:imageView];
    }
    
    //设置scrollView的相关属性
    scrollView.contentSize = CGSizeMake(self.imageNames.count * scrollView.frame.size.width, scrollView.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    
    //加按钮对象
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    float x = (self.imageNames.count - 1) * scrollView.frame.size.width;
    button.frame = CGRectMake(x, 0, scrollView.frame.size.width, scrollView.frame.size.height);
    [button addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    //加入到当前view
    [self.view addSubview:scrollView];
    
    //加入页面控件PageControl
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    self.pageControl = pageControl;
    pageControl.frame = CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 20);
    pageControl.numberOfPages = self.imageNames.count;
    pageControl.pageIndicatorTintColor = [UIColor greenColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    //pageControl.currentPage = 3;
    //关闭用户交互
    pageControl.userInteractionEnabled = NO;
    [self.view addSubview:pageControl];

    scrollView.delegate = self;
    
    [self test];
}

- (void)tap
{
    NSLog(@"...go to...");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%.2f, %.2f", scrollView.contentOffset.x, scrollView.contentOffset.y);
    NSUInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = index;
}

- (void)test
{
    NSLog(@"....");
}

@end
