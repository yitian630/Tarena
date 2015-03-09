//
//  WWAnnotationView.h
//  MyWeiBo
//
//  Created by Vivian on 13-8-21.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import "RTLabel.h"

@interface MyAnnotationView : MKAnnotationView

@property (nonatomic,strong) UIImageView *userImage;
@property (nonatomic,strong) UIImageView *weiboImage;
@property (nonatomic,strong) RTLabel *textLable;
@property (nonatomic,strong) MyAnnotation *annotation;

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier;
@end
