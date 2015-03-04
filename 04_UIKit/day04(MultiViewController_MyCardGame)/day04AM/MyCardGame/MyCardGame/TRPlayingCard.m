//
//  TRPlayingCard.m
//  MyCardGame
//
//  Created by tarena on 14-4-1.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPlayingCard.h"

@implementation TRPlayingCard
@synthesize suit = _suit;

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    if(otherCards.count==1){
        TRPlayingCard *otherCard = [otherCards firstObject];
        if(otherCard.rank == self.rank){
            score = 4;
        }else if(otherCard.suit == self.suit){
            score = 1;
        }
    }
    return score;
}

+ (NSArray *)validSuits
{
    return @[@"♠", @"♥", @"♣", @"♦"];
}
- (void)setSuit:(NSString *)suit
{
    if([[TRPlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}
- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank
{
    return [TRPlayingCard rankStrings].count-1;
}
- (void)setRank:(NSUInteger)rank
{
    if(rank <= [TRPlayingCard maxRank]){
        _rank = rank;
    }
}

- (NSString *)contents
{
    return [self.suit stringByAppendingString:[TRPlayingCard rankStrings][self.rank]];//♥J
}

@end
