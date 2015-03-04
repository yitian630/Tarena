//
//  TRAlbum.m
//  Album
//
//  Created by tarena on 14-4-12.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRAlbum.h"

@implementation TRAlbum
- (id)init
{
    self = [super init];
    if (self) {
        self.images = [@[]mutableCopy];
    }
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@",self.name];
}

@end
