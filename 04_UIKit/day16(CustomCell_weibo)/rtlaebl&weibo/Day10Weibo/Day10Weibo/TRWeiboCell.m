//
//  TRWeiboCell.m
//  Day10Weibo
//
//  Created by tarena on 14-4-23.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRWeiboCell.h"

@implementation TRWeiboCell




-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.nameLabel.text = self.weibo.name;
    NSLog(@"%@",self.weibo.text);
    self.textRTLabel.text = self.weibo.text;
    self.headerIV.image = [UIImage imageWithContentsOfFile:self.weibo.headerPath];
    
    
    self.sourceLabel.text = self.weibo.source;
    self.timeLabel.text = self.weibo.time;
   
    
    //把时间和来源控件的位置修改一下
    CGRect newFrame = self.sourceLabel.frame;
    newFrame.origin.y = self.bounds.size.height-self.sourceLabel.frame.size.height;
    self.sourceLabel.frame = newFrame;
 
    
    self.timeLabel.frame = CGRectMake(self.timeLabel.frame.origin.x, self.bounds.size.height-self.timeLabel.frame.size.height, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    
 
    //修改rtLabel的高度
    CGRect rtFrame = self.textRTLabel.frame;
    rtFrame.size.height = self.weibo.weiboHeight;
    
    self.textRTLabel.frame = rtFrame;
     
    
}

@end
