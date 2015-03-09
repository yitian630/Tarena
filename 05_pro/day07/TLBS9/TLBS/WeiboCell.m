//
//  WeiboCell.m
//  Day10WeiboDemo
//
//  Created by apple on 13-11-26.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "WeiboCell.h"
#import "UIImageView+WebCache.h"
#import "DetailViewController.h"
@implementation WeiboCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initUI];
        
    }
    return self;
}

-(void)initUI{
    //用户头像
    self.userImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 35, 35)];
    
    [self.userImage setContentMode:UIViewContentModeScaleAspectFill];
    self.userImage.clipsToBounds = YES;
    self.userImage.layer.cornerRadius = 5;
    self.userImage.layer.borderWidth = .5;
    self.userImage.layer.borderColor = [UIColor grayColor].CGColor;
    self.userImage.layer.masksToBounds = YES;
    [self.contentView addSubview:self.userImage];
    //昵称
    self.nickLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 5, 200, 20)];
    self.nickLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.nickLabel];
    
       //发布时间
    self.create = [[UILabel alloc]initWithFrame:CGRectZero];
    self.create.font = [UIFont systemFontOfSize:12.0];
    self.create.textColor = [UIColor blueColor];
    [self.contentView addSubview:self.create];
    //微博来源
    self.source = [[UILabel alloc]initWithFrame:CGRectZero];
    self.source.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.source];

    
    [self addSubview:_userImage];
    [self addSubview:_create];
    [self addSubview:_nickLabel];
    [self addSubview:_source];
    self.chat = [[UIButton alloc]initWithFrame:CGRectMake(210, 5, 110, 30)];

    [self.chat setTitle:@"和TA聊天" forState:UIControlStateNormal];
    [self.chat.titleLabel setHighlightedTextColor:[UIColor blackColor]];
    [self.chat.titleLabel setHighlighted:YES];
    [self.chat setImage:[UIImage imageNamed:@"talk.png"] forState:UIControlStateNormal];
    
    
    [self.chat.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [self.chat.titleLabel setTextColor:[UIColor blackColor]];
    [self.contentView addSubview:self.chat];
    [self.chat addTarget:self action:@selector(chatAction) forControlEvents:UIControlEventTouchUpInside];

    
    //微博View
    self.weiboView= [[WeiboView alloc]initWithFrame:CGRectZero];
    [self addSubview:_weiboView];
}
-(void)chatAction{
    
}


//当此控件即将显示的时候
-(void)layoutSubviews{

    [super layoutSubviews];
    //用户头像视图_userImage--------

    NSURL *url = [NSURL URLWithString:self.weibo.user.head];
    
    [self.userImage setImageWithURL:url];
    
    //昵称_nickLabel
    self.nickLabel.text = self.weibo.user.nick;
    self.create.frame = CGRectMake(50, self.bounds.size.height-20, 150, 20);
    self.create.text = [NSString stringWithFormat:@"%@",self.weibo.createDate];
 

    NSString *weiboSource = self.weibo.source;
    self.source.frame =CGRectMake(self.create.frame.size.width+60, self.create.frame.origin.y, 100, 20);
    self.source.text = weiboSource;
//*******************添加微博View
    self.weiboView.weibo = self.weibo;
    [self.weiboView setNeedsLayout];
    self.weiboView.frame = CGRectMake(50, 30, 260, [self.weibo getHeight]);
    
}

//显示Cell的时候 和被用户点击的时候调用此方法
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    //如果cell点击
    if (selected) {
        DetailViewController *vc = [self.delegate.storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
        vc.weibo = self.weibo;
        [self.delegate.navigationController pushViewController:vc animated:YES];
        
        
    }
}




@end
