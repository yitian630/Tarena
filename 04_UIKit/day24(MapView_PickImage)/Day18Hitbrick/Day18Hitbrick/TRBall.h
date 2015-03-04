//
//  TRBall.h
//  Day18Hitbrick
//
//  Created by tarena on 14-5-5.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRBall : UIView
@property (nonatomic)float offsetX;
@property (nonatomic)float offsetY;
-(void)changDirection;
-(void)addSkillByType:(int)skillType;
@end
