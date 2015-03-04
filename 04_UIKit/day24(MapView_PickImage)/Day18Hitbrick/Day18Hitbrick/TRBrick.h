//
//  TRBrick.h
//  Day18Hitbrick
//
//  Created by tarena on 14-5-5.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRBrick : UILabel
@property (nonatomic)int HP;
@property (nonatomic)int skillType;
-(void)dead;
@end
