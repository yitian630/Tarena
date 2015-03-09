//
//  TRMapManager.h
//  TLBS
//
//  Created by tarena on 14-5-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "TRWeiboManager.h"
@interface TRMapManager : NSObject
@property (nonatomic, strong)NSOperationQueue *myQueue;
+(TRMapManager *)shareManager;
//创建位置信息
-(void)createPoiWithLocation:(CLLocationCoordinate2D)location andWeiboID:(NSString *)weiboID;
//检索位置信息
-(void)serchPoiByLocation:(NSString *)location complation:(MyCallback)complation;
@end
