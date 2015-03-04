//
//  TRMusicInfoCell.m
//  Day23Json
//
//  Created by tarena on 14-5-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMusicInfoCell.h"

@implementation TRMusicInfoCell

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
    self.songNameLabel.text = self.musicInfo.name;
    self.singerNameLabel.text = self.musicInfo.singer;
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *singerData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.musicInfo.singerImagePath]];
          NSData *albumData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.musicInfo.albumImagePath]];
        
       dispatch_async(dispatch_get_main_queue(), ^{
           self.singerIV.image = [UIImage imageWithData:singerData];
           self.albumIV.image = [UIImage imageWithData:albumData];
           [self setNeedsLayout];
       });
       
    });
  
    
    
    
    
    
}
@end
