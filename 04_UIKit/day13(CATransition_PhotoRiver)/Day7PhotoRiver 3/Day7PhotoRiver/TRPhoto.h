//
//  TRPhoto.h
//  Day7PhotoRiver
//
//  Created by tarena on 14-4-17.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRDrawView.h"
@interface TRPhoto : UIView
@property (nonatomic, strong)TRDrawView *dv;
@property (nonatomic, strong)UIImageView *iv;
@property (nonatomic)float speed;
@property (nonatomic, strong)NSMutableArray *imagePaths;
@property (nonatomic)CGRect oldFrame;
@property (nonatomic)float oldSpeed;
@property (nonatomic)float oldAlpha;
- (id)initWithFrame:(CGRect)frame andImagePaths:(NSMutableArray *)imagePaths;
@end