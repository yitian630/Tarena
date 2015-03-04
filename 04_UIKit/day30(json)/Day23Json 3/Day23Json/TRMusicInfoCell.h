//
//  TRMusicInfoCell.h
//  Day23Json
//
//  Created by tarena on 14-5-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRMusicInfo.h"
@interface TRMusicInfoCell : UITableViewCell
@property (nonatomic, strong)TRMusicInfo *musicInfo;
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *singerIV;
@property (weak, nonatomic) IBOutlet UILabel *singerNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *albumIV;

@end
