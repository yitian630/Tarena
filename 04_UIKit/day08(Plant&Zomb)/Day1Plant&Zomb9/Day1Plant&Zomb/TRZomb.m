//
//  TRZomb.m
//  Day1CutImage
//
//  Created by tarena on 14-4-9.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRZomb.h"

@implementation TRZomb

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(animation:) userInfo:nil repeats:YES];
        
     
    }
    
    return self;
}


-(void)animation:(NSTimer *)timer{
    
    CGImageRef subImage = CGImageCreateWithImageInRect(self.zombImage.CGImage, CGRectMake(self.count++%8*self.zombImage.size.width/8, 0, self.zombImage.size.width/8, self.zombImage.size.height));
    self.image = [UIImage imageWithCGImage:subImage];
    CGImageRelease(subImage);
    self.center = CGPointMake(self.center.x-self.speed, self.center.y);
    
    if (self.center.x <= -30) {
        [timer invalidate];//让timer停止
        [self removeFromSuperview];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)dealloc
{
    NSLog(@"僵尸死掉了");
}
@end
