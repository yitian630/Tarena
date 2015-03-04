//
//  TRFile.h
//  Day13FileList
//
//  Created by tarena on 14-4-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRFile : NSObject<NSCoding>
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *path;
@property (nonatomic)long long length;
@end
