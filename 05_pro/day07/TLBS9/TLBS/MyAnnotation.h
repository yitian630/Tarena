//
//  WWAnnotatin.h
//  MyWeiBo
//
//  Created by Vivian on 13-8-21.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Weibo.h"

@interface MyAnnotation : NSObject<MKAnnotation>

@property (nonatomic,assign) CLLocationCoordinate2D coordinate;//结构体，包括经度和纬度
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic,strong) Weibo *weibo;
-(id)initWithWeibo:(Weibo*)weibo;
-(id)initWithCoor:(CLLocationCoordinate2D)coor;
@end
