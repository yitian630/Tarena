//
//  TRJsonParser.m
//  Day23Json
//
//  Created by tarena on 14-5-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRJsonParser.h"
#import "TRMusicInfo.h"
@implementation TRJsonParser

+(NSMutableArray *)parseMusicInfosByJsonData:(NSData *)jsonData{
    
    NSArray *musicInfoArr = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:Nil];
    NSMutableArray *musicInfos = [NSMutableArray array];
    for (NSDictionary *musicInfoDic in musicInfoArr) {
        
        TRMusicInfo *mi = [[TRMusicInfo alloc]init];
        mi.name = [musicInfoDic objectForKey:@"song"];
         mi.songID = [musicInfoDic objectForKey:@"song_id"];
         mi.singer = [musicInfoDic objectForKey:@"singer"];
         mi.singerImagePath = [musicInfoDic objectForKey:@"singerPicSmall"];
         mi.albumImagePath = [musicInfoDic objectForKey:@"albumPicSmall"];
        
        [musicInfos addObject:mi];
        
    }
    
    return musicInfos;
    
    
}
@end