//
//  TRPlayingCard.h
//  MyCardGame
//
//  Created by tarena on 14-4-1.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRCard.h"
//此游戏中要使用的扑克牌类
@interface TRPlayingCard : TRCard
//花色  ♠ ♥ ♣ ♦
@property(nonatomic, strong)NSString *suit;
//级别  2 3 4 5 6 7 8 9 10 J Q K A
@property(nonatomic) NSUInteger rank;

//返回所有合法的花色
+ (NSArray *)validSuits;
@end
