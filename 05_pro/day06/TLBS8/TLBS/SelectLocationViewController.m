//
//  SelectLocationViewController.m
//  TLBS-Project
//
//  Created by ivan liu on 14-1-2.
//  Copyright (c) 2014年 Wei WenRu. All rights reserved.
//
#import <MapKit/MapKit.h>
#import "SelectLocationViewController.h"

#import "MyAnnotation.h"
@interface SelectLocationViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *myMV;
@property (nonatomic, strong)CLLocationManager *manager;
@end

@implementation SelectLocationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"选择位置";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bg.png"] forBarMetrics:UIBarMetricsDefault];
    
    //这个方法调用的时候如果会询问用户是否允许使用GPS定为
    if ([CLLocationManager locationServicesEnabled]) {
        self.manager = [[CLLocationManager alloc]init];
        _manager.delegate = self;
        //设置精度
        [_manager setDesiredAccuracy:kCLLocationAccuracyBest];
        //设置走多少米后更新
        [_manager setDistanceFilter:10];
        
        //开始更新自己的经纬度
        [_manager startUpdatingLocation];

    }

    CLLocationCoordinate2D coord;
    coord.latitude =39.90960456049752;
    coord.longitude =116.3972282409668;
    MKCoordinateRegion region = MKCoordinateRegionMake(coord, MKCoordinateSpanMake(0.1, 0.1));
    [self.myMV setRegion:region animated:YES];
    
    //设置一个默认地址
    self.deletage.seletedCoord = coord;
    
}
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation{
    
    NSLog(@"%f   %f",newLocation.coordinate.longitude,newLocation.coordinate.latitude);
    NSMutableDictionary *coordinateDic = [NSMutableDictionary dictionary];
    [coordinateDic setObject:[NSString stringWithFormat:@"%f",newLocation.coordinate.latitude] forKey:@"latitude"];
        [coordinateDic setObject:[NSString stringWithFormat:@"%f",newLocation.coordinate.longitude] forKey:@"longitude"];
    [[NSUserDefaults standardUserDefaults]setObject:coordinateDic forKey:@"location"];
    [[NSUserDefaults standardUserDefaults]synchronize];
  
    MKCoordinateRegion region = MKCoordinateRegionMake(newLocation.coordinate, MKCoordinateSpanMake(0.1, 0.1));
    self.deletage.seletedCoord = newLocation.coordinate;
    [self.myMV setRegion:region animated:YES];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)cancelAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)tapMapAction:(UITapGestureRecognizer *)sender {
    
    //把之前的大头针删除掉
    [self.myMV removeAnnotations:self.myMV.annotations];
    
    CGPoint p = [sender locationInView:self.view];
   self.deletage.seletedCoord =  [self.myMV convertPoint:p toCoordinateFromView:self.view];
    self.laLabel.text = [NSString stringWithFormat:@"%f",self.deletage.seletedCoord.latitude];
    self.loLabel.text = [NSString stringWithFormat:@"%f",self.deletage.seletedCoord.longitude];
    
    MyAnnotation *anno = [[MyAnnotation alloc]initWithCoor:self.deletage.seletedCoord];
    [self.myMV addAnnotation:anno];
    
    
}

@end
