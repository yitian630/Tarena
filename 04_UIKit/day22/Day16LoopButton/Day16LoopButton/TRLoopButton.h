//
//  TRLoopButton.h
//  Day16LoopButton
//
//  Created by tarena on 14-4-30.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRLoopButton : UIButton
@property (nonatomic, strong)NSArray *images;
@property (nonatomic, strong)NSArray *hImages;
@property (nonatomic)int currentIndex;

- (id)initWithFrame:(CGRect)frame andImages:(NSArray*)images andHImages:(NSArray *)hImges;

-(void)setImages:(NSArray *)images andHImages:(NSArray*)hImages;
@end
