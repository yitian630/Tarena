//
//  TRUtils.h
//  Day22ServerFile
//
//  Created by tarena on 14-5-12.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRUtils : NSObject
+(NSMutableArray *)getFilesByDirectoryPath:(NSString *)path;
+(NSMutableData*)getAllDataByHeaderString:(NSString *)string;
@end
