//
//  TRTextView.m
//  Day9TextView
//
//  Created by tarena on 14-5-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRTextView.h"

@implementation TRTextView

- (id)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        self.textView = [[UITextView alloc]initWithFrame:self.bounds];
        
        [self addSubview:self.imageView];
        [self addSubview:self.textView];
      
        self.textView.backgroundColor = [UIColor clearColor];
        self.textView.editable = NO;
        self.textView.font = [UIFont systemFontOfSize:13];
        self.userInteractionEnabled = NO;
    }
    return self;
}
-(void)setIsRight:(BOOL)isRight{
    
    CGRect frame = self.frame;
    UIImage *image = [UIImage imageNamed:@"huihua1.png"];
    if (isRight) {
        image = [UIImage imageNamed:@"huihua2.png"];
        self.textView.textColor = [UIColor whiteColor];
        frame.origin.x = 320-frame.size.width;
    }else{
        frame.origin.x = 0;
        self.textView.textColor = [UIColor blackColor];
    }
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(16, 16, 16, 16)];
    self.imageView.image = image;
    
    
    self.frame = frame;
}
-(void)setText:(NSString *)text{
    _text = text;
    
    self.textView.text = text;
    
    //计算文本的高度和宽度
    
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
    CGSize size = [text boundingRectWithSize:CGSizeMake(200, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    self.bounds = CGRectMake(0, 0, size.width+10, size.height+20);
    self.imageView.frame = self.bounds;
    self.textView.frame = self.bounds;
    
    
    
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
