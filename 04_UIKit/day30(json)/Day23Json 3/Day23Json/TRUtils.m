//
//  TRUtils.m
//  Day23Json
//
//  Created by tarena on 14-5-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRUtils.h"

@implementation TRUtils
+(NSMutableDictionary *)parseLrcByString:(NSString *)lrcString{
    NSLog(@"%@",lrcString);
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSArray *lines = [lrcString componentsSeparatedByString:@"\n"];
    for (NSString *line in lines) {
        
        if (![line hasPrefix:@"[0"]) {
            continue;
        }
        NSArray *timeAndLrc = [line componentsSeparatedByString:@"]"];
        NSString *lrcText =timeAndLrc[1];
        
        NSString *timeStr = [timeAndLrc[0] substringFromIndex:1];
        NSArray *times = [timeStr componentsSeparatedByString:@":"];
        float time = [times[0]intValue]*60+[times[1]floatValue];
        [dic setObject:lrcText forKey:[NSNumber numberWithFloat:time]];
    }
    return dic;
}
@end
