//
//  TRBigPhotoViewController.m
//  Day4Homework
//
//  Created by tarena on 14-4-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRBigPhotoViewController.h"

@interface TRBigPhotoViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mySV;

@end

@implementation TRBigPhotoViewController



- (void)viewDidLoad
{
    self.title = [NSString stringWithFormat:@"%d/%d",self.selectedIndex+1,self.album.imagePaths.count];
    [super viewDidLoad];
    for (int i=0; i<self.album.imagePaths.count; i++) {
        NSString *imagePath = self.album.imagePaths[i];
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(i*320, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        [iv setContentMode:UIViewContentModeScaleAspectFit];
        iv.image = [UIImage imageWithContentsOfFile:imagePath];
        
        [self.mySV addSubview:iv];
    }
    
    self.mySV.pagingEnabled = YES;
    [self.mySV setContentSize:CGSizeMake(320*self.album.imagePaths.count, 0)];
    
    [self.mySV setContentOffset:CGPointMake(self.selectedIndex*320, 0)];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    int currentIndex = self.mySV.contentOffset.x/320;
    self.title = [NSString stringWithFormat:@"%d/%d",currentIndex+1,self.album.imagePaths.count];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
