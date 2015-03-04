//
//  TRWeiboCell.h
//  Day10Weibo
//
//  Created by tarena on 14-4-23.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTLabel.h"
#import "TRWeibo.h"
@interface TRWeiboCell : UITableViewCell
@property (nonatomic, strong)TRWeibo *weibo;
@property (weak, nonatomic) IBOutlet UIImageView *headerIV;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet RTLabel *textRTLabel;


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
