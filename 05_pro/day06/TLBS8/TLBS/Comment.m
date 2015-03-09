//
//  Comment.m
//  Day10WeiboDemo
//
//  Created by apple on 13-11-27.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "Comment.h"

#import "RTLabel.h"
@implementation Comment
-(float)getCommentHight{
    RTLabel *rtLabel = [[RTLabel alloc] initWithFrame:CGRectMake(0, 0, 240, 0)];
    rtLabel.font = [UIFont systemFontOfSize:14.0f];
    rtLabel.text = self.text;
    return rtLabel.optimumSize.height;
}
@end
