//
//  TRCell.m
//  Day12MusicList
//
//  Created by tarena on 14-4-25.
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
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.nameLabel.text = self.music.name;
    self.idLabel.text = self.music.musicID;
    self.singerLabel.text = self.music.singerName;
    self.albumLabel.text = self.music.albumName;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
