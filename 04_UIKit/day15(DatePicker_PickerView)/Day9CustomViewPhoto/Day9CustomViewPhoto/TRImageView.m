//
//  TRImageView.m
//  Day9CustomViewPhoto
//
//  Created by tarena on 14-4-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRImageView.h"

@implementation TRImageView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.layer.cornerRadius = 10;
        
      
    }
    return self;
}
//当控件即将显示的时候会调用 此时info属性肯定有值了 
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.iv.layer.cornerRadius = self.iv.frame.size.width/2;
    self.iv.layer.masksToBounds = YES;
    //从这里设置此自定义控件显示的内容
    self.nameLabel.text = self.info.name;
    self.iv.image = [UIImage imageWithContentsOfFile:self.info.imagePath];
    
    
    
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
