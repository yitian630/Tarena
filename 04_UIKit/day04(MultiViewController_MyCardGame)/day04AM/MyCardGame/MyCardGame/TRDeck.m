//
//  TRDeck.m
//  MyCardGame
//
//  Created by tarena on 14-4-1.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRDeck.h"

@interface TRDeck ()
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation TRDeck
- (NSMutableArray *)cards
{
    if(!_cards)_cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (void)addCard:(TRCard *)card atTop:(BOOL)atTop
{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

- (void)addCard:(TRCard *)card
{
    [self addCard:card atTop:NO];
}

- (TRCard *)drawRandomCard
{
    TRCard *randomCard = nil;
    unsigned int index = arc4random() % self.cards.count;
    randomCard = self.cards[index];
    [self.cards removeObject:randomCard];
    return randomCard;
}

@end
