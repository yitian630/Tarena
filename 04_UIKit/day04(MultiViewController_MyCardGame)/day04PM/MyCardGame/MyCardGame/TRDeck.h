//
//  TRDeck.h
//  MyCardGame
//
//  Created by tarena on 14-4-1.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRCard.h"

//牌桌类
@interface TRDeck : NSObject
//随机发一张扑克牌
- (TRCard *)drawRandomCard;
//尾部插入一个牌
- (void)addCard:(TRCard *)card;
//头部插入一张牌
- (void)addCard:(TRCard *)card atTop:(BOOL)atTop;
@end



