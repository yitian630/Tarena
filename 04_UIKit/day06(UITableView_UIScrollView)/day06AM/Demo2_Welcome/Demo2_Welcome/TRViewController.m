//
//  TRViewController.m
//  Demo2_Welcome
//
//  Created by tarena on 14-4-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

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
                +imageView
                    +image
                +enterButton
     */
    //创建scrollView,并设置frame
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.frame;
    
    //加多个子视图imageView到scrollView
    for(int i=0; i<self.imageNames.count; i++){
        UIImage *image = [UIImage imageNamed:self.imageNames[i]];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        float x = i * scrollView.frame.size.width;
        imageView.frame = CGRectMake(x, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        [scrollView addSubview:imageView];
    }
    
    //设置scrollView的相关属性
    scrollView.contentSize = CGSizeMake(self.imageNames.count * scrollView.frame.size.width, scrollView.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    
    //加入到当前view
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
