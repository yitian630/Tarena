//
//  TRMessageCell.m
//  TLBS
//
//  Created by tarena on 14-4-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMessageCell.h"
#import "TRTextView.h"
@implementation TRMessageCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.myImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:self.myImageView];
        self.clipsToBounds = NO;
        
        self.textView = [[TRTextView alloc]initWithFrame:CGRectMake(0, 20, 200, 20)];
        [self.contentView addSubview:self.textView];
        
    }
    return self;
}



-(void)layoutSubviews
{
    [super layoutSubviews];

      if ([self.message.type isEqualToString:@"image"]){
          if (![self.message from]) {//自己发
         self.textView.text = @"发送图片，点击查看";
          }else{
              self.textView.text = @"接受到图片，点击查看";
          }

     }else if([self.message.type isEqualToString:@"audio"]){//发送的是音频
         if (![self.message from]) {//自己发
             self.textView.text = @"发送音频，点击收听";
         }else{
             self.textView.text = @"接受到音频，点击收听";
         }
     }else{//接收到的是文本
           self.textView.text = self.message.body;
     }
   
    
    if (![self.message from]) {//自己发
        
        [self.textView setIsRight:YES];
        
        
        
    } else {//接收到的消息
        [self.textView setIsRight:NO];
        
    }
    
    
}
//显示Cell的时候 和被用户点击的时候调用此方法
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    //如果cell点击
    if (selected) {
        if ([self.message.type isEqualToString:@"image"]) {
            UIImageView *iv = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
            
            //把base64字符串转成data
            NSData *data = [[NSData alloc]initWithBase64EncodedString:self.message.body options:0];
            //把data转成image
            UIImage *image = [UIImage imageWithData:data];
            iv.image = image;
            [iv setContentMode:UIViewContentModeScaleAspectFit];
            UIViewController *vc = [[UIViewController alloc]init];
            [vc.view setBackgroundColor:[UIColor whiteColor]];
            [vc.view addSubview:iv];
            [self.delegate.navigationController pushViewController:vc animated:YES];
        }else if ([self.message.type isEqualToString:@"audio"]){
            NSData *audioData = [[NSData alloc]initWithBase64EncodedString:self.message.body options:0];
            
            self.player = [[AVAudioPlayer alloc]initWithData:audioData error:nil];
            [self.player play];
            
        }
    }
}


@end
