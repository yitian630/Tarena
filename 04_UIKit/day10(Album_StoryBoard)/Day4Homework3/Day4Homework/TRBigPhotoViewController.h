//
//  TRBigPhotoViewController.h
//  Day4Homework
//
//  Created by tarena on 14-4-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRAlbum.h"
@interface TRBigPhotoViewController : UIViewController<UIScrollViewDelegate>
@property (nonatomic)int selectedIndex;
@property (nonatomic, strong)TRAlbum *album;
@end
