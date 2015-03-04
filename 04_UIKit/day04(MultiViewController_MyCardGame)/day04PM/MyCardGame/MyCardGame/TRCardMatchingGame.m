//
//  TRCardMatchingGame.m
//  MyCardGame
//
//  Created by tarena on 14-4-2.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRCardMatchingGame.h"
@interface TRCardMatchingGame()
@property (nonatomic, strong)NSMutableArray *cards;
@property (nonatomic, readwrite)NSInteger score;
@end

@implementation TRCardMatchingGame
- (NSMutableArray *)cards
{
    if(!_cards)_cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(TRDeck *)deck
{
    self = [super init];
    if (self) {
        for(int i=0; i<count; i++){
            TRCard *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;//初始化失败
                break;
            }
        }
    }
    return self;
}

- (TRCard *)cardAtIndex:(NSUInteger)index
{
    return index<self.cards.count ? self.cards[index] : nil;
}

-(void)chooseCardAtIndex:(NSUInteger)index
{
    //进行匹配
    TRCard *card = [self cardAtIndex:index];
    if(!card.matched){
        if(card.chosen){
            card.chosen = NO;
        }else{
            //选中了一张牌，没有匹配,那么就与其他已经翻过来且没有匹配的牌进行匹配
            for(TRCard *otherCard in self.cards){
                if(otherCard.chosen && !otherCard.matched){
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){//匹配成功
                        card.matched = YES;
                        otherCard.matched = YES;
                        self.score += matchScore * 4;
                    }else{//匹配失败
                        otherCard.chosen = NO;
                        self.score -= 2;
                    }
                }
            }
            card.chosen = YES;
        }
    }
}


@end
