//
//  TRImageListViewController.h
//  Day4HomeWorkStoryboard
//
//  Created by tarena on 14-4-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRAlbum.h"
@interface TRImageListViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *mySV;
@property (nonatomic, strong)TRAlbum *album;
@end
