//
//  TRCard.m
//  MyCardGame
//
//  Created by tarena on 14-4-1.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRCard.h"

@implementation TRCard
- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for (TRCard *card in otherCards) {
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}


@end
