//
//  WWAnnotationView.m
//  MyWeiBo
//
//  Created by Vivian on 13-8-21.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "MyAnnotationView.h"
#import "MyAnnotation.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>
#import "Weibo.h"
#import "UIViewExt.h"


@implementation MyAnnotationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]) {
        MyAnnotation *myAnn = annotation;
        Weibo *w = myAnn.weibo;
        
        
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    self.userImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.userImage.layer.borderColor = [UIColor whiteColor].CGColor;
    self.userImage.layer.borderWidth = 1;
    
    self.weiboImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.weiboImage setBackgroundColor:[UIColor blackColor]];
    self.textLable = [[RTLabel alloc] initWithFrame:CGRectZero];
    self.textLable.font = [UIFont systemFontOfSize:12.0];
    self.textLable.textColor = [UIColor whiteColor];
    self.textLable.backgroundColor = [UIColor clearColor];
    //设置链接的颜色
    self.textLable.linkAttributes = [NSDictionary dictionaryWithObject:@"yellow"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         forKey:@"color"];
    
    [self addSubview:self.weiboImage];
    [self addSubview:self.textLable];
    [self addSubview:self.userImage];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    MyAnnotation *annotation = self.annotation;
    Weibo *weibo = Nil;
    if ([annotation isKindOfClass:[MyAnnotation class]]) {
        weibo = annotation.weibo;
    }
    NSString *userImageString = weibo.user.head;
    [self.userImage setImageWithURL:[NSURL URLWithString:userImageString]];
    
  
        self.image = [UIImage imageNamed:@"nearby_map_content.png"];
        self.userImage.frame = CGRectMake(20, 20, 45, 45);
    self.userImage.layer.cornerRadius = 22.5;
    self.userImage.clipsToBounds = YES;
        self.textLable.hidden = NO;
        self.textLable.frame = CGRectMake(self.userImage.right+5, self.userImage.top, 110, 45);
        self.textLable.text = weibo.text;
        self.weiboImage.hidden = YES;

    
    
}

@end
