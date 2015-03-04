//
//  TRAlbum.m
//  Day4Homework
//
//  Created by tarena on 14-4-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRAlbum.h"

@implementation TRAlbum
- (id)init
{
    self = [super init];
    if (self) {
        self.imagePaths = [NSMutableArray array];
    }
    return self;
}
@end
