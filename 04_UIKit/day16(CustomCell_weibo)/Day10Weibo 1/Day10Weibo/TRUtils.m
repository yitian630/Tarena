//
//  TRUtils.m
//  Day9CustomTableHeaderView
//
//  Created by tarena on 14-4-23.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRUtils.h"

@implementation TRUtils
+(NSMutableArray *)getAllWeibosByPath:(NSString *)path{
    NSMutableArray *weibos = [NSMutableArray array];
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSArray *direcotryNames = [fm contentsOfDirectoryAtPath:path error:Nil];
    
    for (NSString *directoryName in direcotryNames) {
        //过滤隐藏文件
        if ([directoryName hasPrefix:@"."]) {
            continue;
        }
        TRWeibo *weibo = [[TRWeibo alloc]init];
        weibo.headerPath = [NSString stringWithFormat:@"%@/%@/head.jpg",path,directoryName];
        NSString *weiboInfoPath =[NSString stringWithFormat:@"%@/%@/info.txt",path,directoryName];
        NSString *weiboInfoText = [NSString stringWithContentsOfFile:weiboInfoPath encoding:NSUTF8StringEncoding error:Nil];
        NSArray *infos = [weiboInfoText componentsSeparatedByString:@"\n"];
        weibo.name = infos[0];
        weibo.source = infos[1];
        weibo.time = infos[2];
        weibo.text = infos[3];
        
        [weibos addObject:weibo];
    }
    
    
    return weibos;
    
    
}
@end
