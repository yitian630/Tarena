//
//  TRAlbum.h
//  Album
//
//  Created by tarena on 14-4-12.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRAlbum : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,strong)NSMutableArray *images;
@end
