//
//  WWAnnotatin.m
//  MyWeiBo
//
//  Created by Vivian on 13-8-21.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation
- (id)initWithCoor:(CLLocationCoordinate2D)coor
{
    self = [super init];
    if (self) {
        self.coordinate = coor;
    }
    return self;
}
-(id)initWithWeibo:(Weibo*)weibo {
    if (self==[super init]) {
        self.weibo = weibo;
   
        self.coordinate = CLLocationCoordinate2DMake([weibo.latitude doubleValue],[weibo.longitude doubleValue]);
        self.title = weibo.user.nick;
        self.subtitle = weibo.text;
    }
    return self;
}

@end
