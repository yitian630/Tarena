//
//  TRScaleScrollView.m
//  Day27ScaleSV
//
//  Created by tarena on 14-5-17.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRScaleScrollView.h"

@implementation TRScaleScrollView

- (id)initWithFrame:(CGRect)frame andImage:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.iv = [[UIImageView alloc]initWithFrame:self.bounds];
        self.iv.image = image;
        [self addSubview:self.iv];
        
        //设置缩放的最大值和最小值
        [self setMaximumZoomScale:5];
        [self setMinimumZoomScale:1];
        self.delegate = self;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
        self.iv.userInteractionEnabled = YES;
        [tap setNumberOfTapsRequired:2];
        [self.iv addGestureRecognizer:tap];
    }
    return self;
}
-(void)tapAction{
    [self setZoomScale:self.zoomScale*1.5 animated:YES];
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.iv;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
