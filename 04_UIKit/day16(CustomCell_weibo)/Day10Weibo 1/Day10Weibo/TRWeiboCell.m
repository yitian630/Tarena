//
//  TRWeiboCell.m
//  Day10Weibo
//
//  Created by tarena on 14-4-23.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRWeiboCell.h"

@implementation TRWeiboCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.nameLabel.text = self.weibo.name;
    self.sourceLabel.text = self.weibo.source;
    self.timeLabel.text = self.weibo.time;
    self.textTV.text = self.weibo.text;
    self.headerIV.image = [UIImage imageWithContentsOfFile:self.weibo.headerPath];
    
    
    
}

@end
