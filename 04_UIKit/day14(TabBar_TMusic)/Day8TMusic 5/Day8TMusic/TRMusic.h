//
//  TRMusic.h
//  Day8TMusic
//
//  Created by tarena on 14-4-30.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRMusic : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *path;
@property (nonatomic, copy)NSString *artist;
@property (nonatomic, copy)NSString *album;
@property (nonatomic, strong)UIImage *artwork;
-(id)initWithPath:(NSString *)path;
@end
