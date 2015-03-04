//
//  TRViewController.m
//  Day18UIMapView
//
//  Created by tarena on 14-5-5.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import <MapKit/MapKit.h>
@interface TRViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *myMV;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //    北纬：39.90960456049752
//    东经：116.3972282409668
    CLLocationCoordinate2D coor;
    coor.latitude = 39.90960456049752;
    coor.longitude =116.3972282409668;
    //缩放级别
    MKCoordinateSpan span;
    span.latitudeDelta = 0.01;
    span.longitudeDelta = 0.01;
    //设置地图的显示区域
    [self.myMV setRegion:MKCoordinateRegionMake(coor, span)];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
