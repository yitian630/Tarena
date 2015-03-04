//
//  TRFile.m
//  Day13FileList
//
//  Created by tarena on 14-4-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRFile.h"

@implementation TRFile
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.path forKey:@"path"];
    [aCoder encodeInt64:self.length forKey:@"length"];
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.path = [aDecoder decodeObjectForKey:@"path"];
        self.length = [aDecoder decodeInt64ForKey:@"length"];
        
    }
    return self;
}
@end
