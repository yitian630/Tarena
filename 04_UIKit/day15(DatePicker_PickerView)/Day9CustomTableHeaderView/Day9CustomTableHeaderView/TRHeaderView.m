//
//  TRHeaderView.m
//  Day9CustomTableHeaderView
//
//  Created by tarena on 14-4-21.
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

-(void)layoutSubviews{
    [super layoutSubviews];
    self.nameLabel.text = self.wb.name;
    self.headerIV.image = [UIImage imageWithContentsOfFile:self.wb.headerPath];
    self.infoTV.text = self.wb.text;
    self.sourceLabel.text = self.wb.source;
    self.timeLabel.text = self.wb.time;
    
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
