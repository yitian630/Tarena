//
//  TRScaleScrollView.h
//  Day27ScaleSV
//
//  Created by tarena on 14-5-17.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRScaleScrollView : UIScrollView<UIScrollViewDelegate>
@property (nonatomic, strong)UIImageView *iv;
- (id)initWithFrame:(CGRect)frame andImage:(UIImage*)image;
@end
