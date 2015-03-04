//
//  TRBook.m
//  Day12XML
//
//  Created by tarena on 14-4-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRBook.h"

@implementation TRBook
-(NSString *)description{
    return [NSString stringWithFormat:@"name:%@ author:%@ price:%f page:%d",self.name,self.author,self.price,self.page];
}
@end
