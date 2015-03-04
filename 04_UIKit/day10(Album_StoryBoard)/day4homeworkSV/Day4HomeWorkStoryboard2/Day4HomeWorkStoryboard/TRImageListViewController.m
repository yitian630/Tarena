//
//  TRImageListViewController.m
//  Day4HomeWorkStoryboard
//
//  Created by tarena on 14-4-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRImageListViewController.h"

@interface TRImageListViewController ()

@end

@implementation TRImageListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (int i=0; i<self.album.imagePaths.count; i++) {
        NSString *imagePath = self.album.imagePaths[i];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i%4*80, i/4*80, 80, 80)];
        btn.tag = i;
        [btn setImage:[UIImage imageWithContentsOfFile:imagePath] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickedImage:) forControlEvents:UIControlEventTouchUpInside];
        [self.mySV addSubview:btn];
    }
    
    int row = self.album.imagePaths.count%4==0?self.album.imagePaths.count/4 : self.album.imagePaths.count/4+1;
    [self.mySV setContentSize:CGSizeMake(0, row*80)];
    
    
}
-(void)clickedImage:(UIButton*)btn{
    
//    TRBigPhotoViewController *bigVc = [[TRBigPhotoViewController alloc]init];
//    bigVc.selectedIndex = btn.tag;
//    bigVc.album = self.album;
//    [self.navigationController pushViewController:bigVc animated:YES];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
