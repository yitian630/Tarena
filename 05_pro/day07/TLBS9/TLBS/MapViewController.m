//
//  MapViewController.m
//  Day10WeiboDemo
//
//  Created by apple on 13-11-29.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "MapViewController.h"
#import "WeiboCell.h"

#import "DetailViewController.h"
#import <MapKit/MapKit.h>
#import "MyAnnotationView.h"
#import "MyAnnotation.h"
#import "WeiboPaser.h"


#import "TRAppDelegate.h"
 
@interface MapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *myMV;
@property (nonatomic, strong)NSMutableArray *requests;
@end

@implementation MapViewController


- (void)viewDidLoad
{
    //创建天安门坐标
    CLLocationCoordinate2D coord;
    coord.latitude =39.90960456049752;
    coord.longitude =116.3972282409668;
    MKCoordinateRegion region = MKCoordinateRegionMake(coord, MKCoordinateSpanMake(0.1, 0.1));
    [self.myMV setRegion:region animated:YES];
    
    
    
    
    
    [self loadNearByWeiboByCoordinate:coord];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)loadNearByWeiboByCoordinate:(CLLocationCoordinate2D)coordinate{

    for (Weibo *w in self.weibos) {
                //创建Annotation对象，添加到地图上
                MyAnnotation *annotation = [[MyAnnotation alloc] initWithWeibo:w];
                [self.myMV addAnnotation:annotation];
              
            }
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    //如果annotation为用户自身位置的小蓝点  就什么都不做
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    static NSString *identifier = @"myAnnotationView";
    MyAnnotationView *annotationView = (MyAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (annotationView == nil) {
        annotationView = [[MyAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpDetail:)];
    [annotationView addGestureRecognizer:tap];
    return annotationView;
}

-(void)jumpDetail:(UITapGestureRecognizer*)tap{
    MyAnnotationView *mav = (MyAnnotationView*)tap.view;
    
    Weibo *weibo = mav.annotation.weibo;
    DetailViewController * dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    dvc.weibo = weibo;
    
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
