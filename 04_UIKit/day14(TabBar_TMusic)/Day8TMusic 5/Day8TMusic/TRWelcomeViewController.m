//
//  TRViewController.m
//  Day8TMusic
//
//  Created by tarena on 14-4-18.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRWelcomeViewController.h"

@interface TRWelcomeViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation TRWelcomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // ad data
    NSArray * ads = @[@"Welcome_3.0_1.jpg", @"Welcome_3.0_2.jpg", @"Welcome_3.0_3.jpg", @"Welcome_3.0_4.jpg", @"Welcome_3.0_5.jpg"];
    
    // config scroll view and image views;
    for (int i = 0 ; i < ads.count; i++) {
        UIImage * image = [UIImage imageNamed:ads[i]];
        
        UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(i*self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:imageView];
        
        if (i == ads.count - 1) {
            
            imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(start:)];
            [imageView addGestureRecognizer:tap];
       
        }
    }
    
 //设置滚动
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*ads.count, 0);
    self.scrollView.pagingEnabled = YES;
    
    // config the page control
  
    self.pageControl.frame = CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 20);
    self.pageControl.numberOfPages = ads.count;
    self.pageControl.currentPage = 0;
    self.pageControl.userInteractionEnabled = NO;
  
   
}
- (void)start:(id)sender {
    [self performSegueWithIdentifier:@"tabbarvc" sender:Nil];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = round(scrollView.contentOffset.x / scrollView.frame.size.width);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
