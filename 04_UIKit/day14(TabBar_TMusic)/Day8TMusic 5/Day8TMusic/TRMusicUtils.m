//
//  TRMusicUtils.m
//  Day8TMusic
//
//  Created by tarena on 14-4-30.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMusicUtils.h"
#import "TRMusic.h"
@implementation TRMusicUtils
+(NSMutableArray *)getAllMusicByPath:(NSString *)path{
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:path error:Nil];
    NSMutableArray *musics = [NSMutableArray array];
    for (NSString *fileName in fileNames) {
        
        if ([fileName hasSuffix:@"mp3"]) {
            NSString *musicPath = [path stringByAppendingPathComponent:fileName];
            TRMusic *music = [[TRMusic alloc]initWithPath:musicPath];
            [musics addObject:music];
        }
        
    }
    return musics;
    
    
}
@end
