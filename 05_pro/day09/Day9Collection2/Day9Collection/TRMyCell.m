//
//  TRMyCell.m
//  Day9Collection
//
//  Created by tarena on 14-5-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMyCell.h"

@implementation TRMyCell

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
    self.myIV.image = [UIImage imageNamed:@"a.jpg"];
}
- (IBAction)clicked:(id)sender {
    
    NSLog(@"第%d个Cell",self.tag);
    
}
@end
