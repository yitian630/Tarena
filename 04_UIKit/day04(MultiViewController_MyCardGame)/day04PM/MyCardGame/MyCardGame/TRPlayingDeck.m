//
//  TRPlayingDeck.m
//  MyCardGame
//
//  Created by tarena on 14-4-2.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPlayingDeck.h"
#import "TRPlayingCard.h"
@implementation TRPlayingDeck
+ (instancetype)playingDeck
{
    TRPlayingDeck *deck = [[TRPlayingDeck alloc]init];
    return deck;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        for (NSString *suit in [TRPlayingCard validSuits]) {
            for(NSUInteger rank = 1; rank <= [TRPlayingCard maxRank]; rank++){
                TRPlayingCard *card = [[TRPlayingCard alloc]init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
    }
    return self;
}
@end
