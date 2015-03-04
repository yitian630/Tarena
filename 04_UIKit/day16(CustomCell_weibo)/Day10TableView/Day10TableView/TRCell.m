//
//  TRCell.m
//  Day10TableView
//
//  Created by tarena on 14-4-23.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRCell.h"

@implementation TRCell

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

@end
