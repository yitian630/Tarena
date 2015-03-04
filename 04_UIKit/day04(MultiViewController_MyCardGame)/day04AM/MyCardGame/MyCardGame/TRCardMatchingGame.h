//
//  TRCardMatchingGame.h
//  MyCardGame
//
//  Created by tarena on 14-4-2.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRCard.h"
#import "TRDeck.h"

@interface TRCardMatchingGame : NSObject
//选中一第扑克牌的处理方法
- (void)chooseCardAtIndex:(NSUInteger)index;
//返回指定下标的牌
- (TRCard *)cardAtIndex:(NSUInteger)index;

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(TRDeck *)deck;

//得分
@property (nonatomic, readonly) NSInteger score;
@end
