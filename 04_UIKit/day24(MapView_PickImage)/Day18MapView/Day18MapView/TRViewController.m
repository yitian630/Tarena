//
//  TRViewController.m
//  Day18MapView
//
//  Created by tarena on 14-5-5.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface TRViewController ()
@property (nonatomic, strong)CLLocationManager *manager;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //判断应用是否开启了 位置服务
    if ([CLLocationManager locationServicesEnabled]) {
        
        self.manager = [[CLLocationManager alloc]init];
        self.manager.delegate = self;
        //设置精度
        [self.manager setDesiredAccuracy:kCLLocationAccuracyBest];
        //设置更新距离
        [self.manager setDistanceFilter:20];
        //开始更新
        [self.manager startUpdatingLocation];
        //获得陀螺仪的值
        [self.manager startUpdatingHeading];
    }
}

//获取当前的经纬度
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation{
    NSLog(@"latitude %f  longitude %f",newLocation.coordinate.latitude,newLocation.coordinate.longitude);
}
//获取陀螺仪的值 做指南针的话 就是用这个数值
- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading{
    NSLog(@"%f",newHeading.trueHeading);
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
