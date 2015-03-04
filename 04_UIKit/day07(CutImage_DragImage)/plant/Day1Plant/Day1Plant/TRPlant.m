//
//  TRPlant.m
//  Day1Plant
//
//  Created by tarena on 14-4-9.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPlant.h"

@implementation TRPlant

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    }
    return self;
}
-(void)changeImage{
    UIImage *plantImage = [UIImage imageNamed:@"plant_0.png"];
    
    CGImageRef subImage = CGImageCreateWithImageInRect(plantImage.CGImage, CGRectMake(self.count++%8*plantImage.size.width/8, 0, plantImage.size.width/8, plantImage.size.height));
    
    self.image = [UIImage imageWithCGImage:subImage];
    CGImageRelease(subImage);
    
    
    
    
}
@end
