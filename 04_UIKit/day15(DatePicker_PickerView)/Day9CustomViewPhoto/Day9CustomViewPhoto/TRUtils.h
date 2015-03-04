//
//  TRUtils.h
//  Day9CustomViewPhoto
//
//  Created by tarena on 14-4-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRImageInfo.h"
@interface TRUtils : NSObject
+ (NSMutableArray *)findImageInfosByPath:(NSString *)path;
@end
