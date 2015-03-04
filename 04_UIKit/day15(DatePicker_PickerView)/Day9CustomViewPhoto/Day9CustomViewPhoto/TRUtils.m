//
//  TRUtils.m
//  Day9CustomViewPhoto
//
//  Created by tarena on 14-4-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRUtils.h"

@implementation TRUtils
+(NSMutableArray *)findImageInfosByPath:(NSString *)path{
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:path error:nil];
    NSMutableArray *imageInfos = [NSMutableArray array];
    for (NSString *fileName in fileNames) {
        if ([fileName hasSuffix:@"jpg"]) {
            TRImageInfo *imageInfo = [[TRImageInfo alloc]init];
            imageInfo.name = fileName;
            imageInfo.imagePath = [path stringByAppendingPathComponent:fileName];
            
            [imageInfos addObject:imageInfo];
        }
    }
    
    return imageInfos;
}
@end
