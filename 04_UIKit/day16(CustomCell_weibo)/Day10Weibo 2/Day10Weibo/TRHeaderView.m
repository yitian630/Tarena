//
//  TRHeaderView.m
//  Day10Weibo
//
//  Created by tarena on 14-4-23.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRHeaderView.h"

@implementation TRHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.headerIV.image = [UIImage imageWithContentsOfFile:self.weibo.headerPath];
    self.nameLabel.text = self.weibo.name;
    self.sourceLabel.text = self.weibo.source;
    self.timeLabel.text = self.weibo.time;
    self.textRTLabel.text = self.weibo.text;
    
    NSLog(@"%f",self.frame.size.height);
 //修改time 和source的位置
    self.timeLabel.frame = CGRectMake(self.timeLabel.frame.origin.x, self.frame.size.height-self.timeLabel.frame.size.height +40, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    NSLog(@"%f   h = %f",self.timeLabel.frame.origin.y,self.timeLabel.frame.size.height);
      self.sourceLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x, self.frame.size.height-self.sourceLabel.frame.size.height +40, self.sourceLabel.frame.size.width, self.sourceLabel.frame.size.height);
    self.textRTLabel.frame = CGRectMake(self.textRTLabel.frame.origin.x, self.textRTLabel.frame.origin.y, 206, self.weibo.weiboHeight);
}
@end
