//
//  TRLoopButton.m
//  Day16LoopButton
//
//  Created by tarena on 14-4-30.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRLoopButton.h"

@implementation TRLoopButton
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initButton];
    }
    
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initButton];
    }
    return self;
}

-(void)setImages:(NSArray *)images andHImages:(NSArray *)hImages{
    self.images = images;
    self.hImages = hImages;
   
    [self updateImage];
}

-(void)initButton{
   
    [self addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)updateImage{
    NSString *imageName = self.images[self.currentIndex];
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //设置高亮图片
    NSString *hImageName =self.hImages[self.currentIndex];
    if (hImageName) {
        [self setImage:[UIImage imageNamed:hImageName] forState:UIControlStateHighlighted];
    }

}
-(void)clicked:(UIButton*)btn{
   
    self.currentIndex = (self.currentIndex+1)%self.images.count;
    
    [self updateImage];
    
    
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
