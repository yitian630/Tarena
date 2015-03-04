//
//  TRBook.h
//  day01
//
//  Created by tarena on 14-3-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRBook : NSObject<NSCopying>
@property(nonatomic,assign)float price;
-(id)initWithPrice:(float)price;
@end




