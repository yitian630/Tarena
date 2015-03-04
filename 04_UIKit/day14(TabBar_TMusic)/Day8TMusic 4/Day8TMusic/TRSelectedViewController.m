//
//  TRSelectedViewController.m
//  TMusic
//
//  Created by Alex Zhao on 13-8-8.
//  Copyright (c) 2013年 Tarena. All rights reserved.
//

#import "TRSelectedViewController.h"



@interface TRSelectedViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *mySV;



@end

@implementation TRSelectedViewController




#pragma mark - View Controller Life-cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //添加小SV里面的内容
    [self initSubSV];
}
-(void)initSubSV{
    for (int i=0; i<5; i++) {
        NSString *imageName =[NSString stringWithFormat:@"ad0%d.png",i+1];
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(i*self.mySubSV.frame.size.width, 0, self.mySubSV.frame.size.width, self.mySubSV.frame.size.height)];
        iv.image = [UIImage imageNamed:imageName];
        [self.mySubSV addSubview:iv];
    }
    [self.mySubSV setContentSize:CGSizeMake(self.mySubSV.frame.size.width*5, 0)];
}
-(void)viewDidAppear:(BOOL)animated{
    self.mySV.contentSize = CGSizeMake(640, 0);
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
    self.pageControl.currentPage = scrollView.contentOffset.x/320;
}




@end















