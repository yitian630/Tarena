//
//  Weibo.m
//  Day10WeiboDemo
//
//  Created by apple on 13-11-26.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "Weibo.h"
#import "RTLabel.h"
#import "UIViewExt.h"
@implementation Weibo

-(float)getHeight{
    /**
     *   实现思路：计算每个子视图的高度，然后相加。
     **/
    float height = 0;
    //--------------------计算微博内容text的高度------------------------
    RTLabel *textLabel = [[RTLabel alloc] initWithFrame:CGRectZero];
    textLabel.font = [UIFont systemFontOfSize:14];
    textLabel.width = 260;

    //如果是转发
    if (_isRepost) {
        textLabel.width -= 20;
    }
    if (_isRepost) {
        NSMutableString *text = [NSMutableString string];
        NSString *nickName = self.user.nick;
        [text appendString:nickName];
        NSString *sourceWeiboText = self.text;
        [text appendString:sourceWeiboText];
        textLabel.text = text;
    }else {
        textLabel.text = self.text;
    }
    height += textLabel.optimumSize.height;
    //--------------------计算微博图片的高度------------------------
        NSString *thumbnailImage = self.thumbnailImage;
    //如果有图片
        if (thumbnailImage != nil && ![@"" isEqualToString:thumbnailImage]) {
            height += 90;
        }
 
    //--------------------计算转发微博视图的高度------------------------
    //转发的微博
    Weibo *relWeibo = self.relWeibo;
    if (relWeibo != nil) {
        //转发微博视图的高度
        float repostHeight = [relWeibo getHeight];
        height += repostHeight;
    }
    if (_isRepost == YES) {
        height += 20;
    }
    return height;
}
@end
