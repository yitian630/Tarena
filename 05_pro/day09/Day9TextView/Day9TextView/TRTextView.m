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
        UIImage *image = [UIImage imageNamed:@"huihua2.png"];
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(16, 16, 16, 16)];
         self.imageView.image = image;
        self.textView.backgroundColor = [UIColor clearColor];
        self.textView.editable = NO;
        self.textView.font = [UIFont systemFontOfSize:13];
    }
    return self;
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
