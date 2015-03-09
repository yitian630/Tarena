//
//  WeiboView.m
//  Day10WeiboDemo
//
//  Created by apple on 13-11-26.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "WeiboView.h"
#import "WeiboPaser.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"

@implementation WeiboView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    //添加文本控件
    self.weiboLabel = [[RTLabel alloc]initWithFrame:self.bounds];
    self.weiboLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.weiboLabel];
    //微博图片
    self.image = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.image.backgroundColor = [UIColor clearColor];
    //设置图片的内容显示模式：等比例缩/放
    self.image.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.image];
}
-(void)layoutSubviews {
    
    [super layoutSubviews];
    self.weiboLabel.frame = CGRectMake(0, 0, self.width, 20);
    //判断当前视图是否为转发视图
    if (self.weibo.isRepost) {
        self.weiboLabel.frame = CGRectMake(10, 10, self.width-20, 0);
        NSMutableString *text = [NSMutableString string];
        NSString *nickName = self.weibo.user.nick;
        [text appendString:nickName];
        [text appendString:@":"];
        NSString *sourceWeiboText = self.weibo.text;
        sourceWeiboText = sourceWeiboText;
        [text appendString:sourceWeiboText];
        self.weiboLabel.text = text;
    }else {
        self.weiboLabel.text = self.weibo.text;
    }
    
    //文本内容尺寸
    CGSize textSize = self.weiboLabel.optimumSize;
    self.weiboLabel.height = textSize.height;
    //---------------转发的微博视图_repostView------------------
    //如果有转发的微博 添加一次自身
    Weibo *repostWeibo = self.weibo.relWeibo;
    if (repostWeibo != nil) {
        //添加转发微博视图
        [self addRepostView];
        self.repostView.hidden = NO;
        self.repostView.weibo = repostWeibo;
        //计算转发微博视图的高度
        float height = [self.repostView.weibo getHeight];
        self.repostView.frame = CGRectMake(0, self.weiboLabel.bottom+10, self.width, height);
    }else {
        self.repostView.hidden = YES;
    }
    //---------------微博图片视图_image------------------
    
    NSString *thumbnailImage = self.weibo.thumbnailImage;
    if (thumbnailImage != nil && ![@"" isEqualToString:thumbnailImage]) {
        self.image.hidden = NO;
        self.image.frame = CGRectMake(10, self.weiboLabel.bottom+10, 80, 80);
        //加载网络图片
        NSURL *url = [NSURL URLWithString:thumbnailImage];
        [self.image setImageWithURL:url];
    } else {
        //为了避免复用时 之前的图片仍然现实
        self.image.hidden = YES;
    }
}
 //创建转发的微博View
- (void)addRepostView {
    
    if (self.repostView == nil) {
        self.repostView = [[WeiboView alloc] initWithFrame:CGRectZero];
        [self.repostView setBackgroundColor:[UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1]];
        [self addSubview:self.repostView];
        
    }
}
@end
