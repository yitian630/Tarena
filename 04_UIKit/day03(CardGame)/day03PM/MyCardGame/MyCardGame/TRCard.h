//
//  TRCard.h
//  MyCardGame
//
//  Created by tarena on 14-4-1.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
//扑克牌类(实体类)
@interface TRCard : NSObject
@property(nonatomic, getter=isChosen) BOOL chosen;//被选中
@property(nonatomic, getter=isMatched) BOOL matched;//被匹配
@property(nonatomic, strong) NSString *contents;//内容: 如"♥10"

//当前扑克牌和另外一些牌匹配后,返回得分
- (int)match:(NSArray *)otherCards;
@end



