//
//  Fraction.h
//  Fraction
//
//  Created by tarena on 14-3-22.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
@property (nonatomic,assign) int numerator;
@property (nonatomic,assign) int denominator;
- (id)initWithNumerator:(int)numerator andDenominator:(int)denominator;
-(Fraction*)add:(Fraction*)fraction;
-(Fraction*)sub:(Fraction*)fraction;
-(Fraction*)mul:(Fraction*)fraction;
-(Fraction*)div:(Fraction*)fraction;
-(void)show;
@end
