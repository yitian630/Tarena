//
//  TRAlbum.h
//  Day4Homework
//
//  Created by tarena on 14-4-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRAlbum : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, strong)NSMutableArray *imagePaths;
@property (nonatomic, copy)NSString *path;
@end
