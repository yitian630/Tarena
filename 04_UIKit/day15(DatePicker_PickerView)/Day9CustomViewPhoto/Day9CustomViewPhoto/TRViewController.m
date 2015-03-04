//
//  TRViewController.m
//  Day9CustomViewPhoto
//
//  Created by tarena on 14-4-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRUtils.h"
#import "TRImageInfo.h"
#import "TRImageView.h"
@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mySV;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSArray *imageInfos = [TRUtils findImageInfosByPath:@"/Users/tarena/Desktop/liuguobing/Photos.localized/照片"];
    
    for (int i=0; i<imageInfos.count; i++) {
        
        TRImageInfo *imageInfo = imageInfos[i];
        
        TRImageView *iv = [[[NSBundle mainBundle]loadNibNamed:@"TRImageView" owner:self options:nil]lastObject];
        iv.info = imageInfo;
        iv.frame = CGRectMake(i%3*102+8, i/3*102, 100, 100);
        [self.mySV addSubview:iv];
        
        
    }
    
    int row = imageInfos.count%3==0 ? imageInfos.count/3 : imageInfos.count/3+1;
    
    //设置sv的滚动
    [self.mySV setContentSize:CGSizeMake(0, row*102)];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
