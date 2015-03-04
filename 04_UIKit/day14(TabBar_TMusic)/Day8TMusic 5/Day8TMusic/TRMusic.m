//
//  TRMusic.m
//  Day8TMusic
//
//  Created by tarena on 14-4-30.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMusic.h"
#import "Utils.h"
@implementation TRMusic
- (id)initWithPath:(NSString *)path
{
    self = [super init];
    if (self) {
        self.path = path;
        
        NSDictionary *musicDic = [Utils getMusicInfoByPath:path];
        self.name = [musicDic objectForKey:@"Title"];
        self.artist = [musicDic objectForKey:@"Artist"];
        self.album = [musicDic objectForKey:@"Album"];
        self.artwork = [musicDic objectForKey:@"Artwork"];
    }
    return self;
}
@end
