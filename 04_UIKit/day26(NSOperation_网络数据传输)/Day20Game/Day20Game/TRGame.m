//
//  TRGame.m
//  Day20Game
//
//  Created by tarena on 14-5-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRGame.h"
#import "TRRow.h"
@implementation TRGame


-(void)gameStart{
    
    for (int i=-1; i<4; i++) {
        TRRow *r = [[TRRow alloc]initWithFrame:CGRectMake(0, i*142, 320, 142)];
        [self.view addSubview:r];
        
    }
    
}
@end
