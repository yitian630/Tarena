//
//  TRFile.m
//  Day22ServerFile
//
//  Created by tarena on 14-5-12.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRFile.h"

@implementation TRFile
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
     [aCoder encodeObject:self.path forKey:@"path"];
    [aCoder encodeInteger:self.length forKey:@"length"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
            self.length = [aDecoder decodeIntegerForKey:@"length"];
            self.path = [aDecoder decodeObjectForKey:@"path"];
    }
    return self;
}
@end
