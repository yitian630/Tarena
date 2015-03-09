//
//  TRSendingWeiboViewController.h
//  TLBS-Project
//
//  Created by LIU XU on 13-12-22.
//  Copyright (c) 2013年 Wei WenRu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboApi.h"
#import <CoreLocation/CoreLocation.h>
@interface TRSendingWeiboViewController : UIViewController<WeiboRequestDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *sendInfoTV;
@property (weak, nonatomic) IBOutlet UIImageView *iv;
@property (nonatomic)CLLocationCoordinate2D seletedCoord;

@end
