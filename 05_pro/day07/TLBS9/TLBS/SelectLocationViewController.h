//
//  SelectLocationViewController.h
//  TLBS-Project
//
//  Created by ivan liu on 14-1-2.
//  Copyright (c) 2014年 Wei WenRu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "TRSendingWeiboViewController.h"
@interface SelectLocationViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *laLabel;
@property (weak, nonatomic) IBOutlet UILabel *loLabel;
- (IBAction)cancelAction:(id)sender;
@property (nonatomic, weak)TRSendingWeiboViewController *deletage;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;


@end
