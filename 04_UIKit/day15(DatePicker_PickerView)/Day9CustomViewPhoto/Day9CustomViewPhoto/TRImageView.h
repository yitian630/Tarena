//
//  TRImageView.h
//  Day9CustomViewPhoto
//
//  Created by tarena on 14-4-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageInfo.h"
@interface TRImageView : UIView
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iv;
@property (nonatomic, strong)TRImageInfo *info;
@end
