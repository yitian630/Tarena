//
//  TRJsonParser.h
//  Day23Json
//
//  Created by tarena on 14-5-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRJsonParser : NSObject


+(NSMutableArray *)parseMusicInfosByJsonData:(NSData *)jsonData;
@end
