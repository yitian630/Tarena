//
//  Fraction.m
//  Fraction
//
//  Created by tarena on 14-3-22.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction
//@synthesize numerator=_numerator;
//
//-(void)setNumerator:(int)numerator {
//    _numerator = numerator;
//}
//
//-(int)numerator {
//    return _numerator;
//}

- (id)initWithNumerator:(int)numerator andDenominator:(int)denominator
{
    self = [super init];
    if (self) {
        self.numerator = numerator;
        self.denominator = denominator;
    }
    return self;
}

+(id)fractionWithNumerator:(int)numerator andDenominator:(int)denominator{
    Fraction *fraction = [[[Fraction alloc]init]autorelease];
    fraction.numerator = numerator;
    fraction.denominator = denominator;
    return fraction;
}

-(Fraction*)add:(Fraction*)fraction {
    self.numerator = self.numerator*fraction.denominator+self.denominator*fraction.numerator;
    self.denominator = self.denominator*fraction.denominator;
    [self reduction];
    return self;
}
-(Fraction*)sub:(Fraction*)fraction{
    self.numerator = self.numerator*fraction.denominator-self.denominator*fraction.numerator;
    self.denominator = self.denominator*fraction.denominator;
    [self reduction];
    return self;
}
-(Fraction*)mul:(Fraction*)fraction{
    self.numerator = self.numerator*fraction.numerator;
    self.denominator = self.denominator*fraction.denominator;
    [self reduction];
    return self;
}
-(Fraction*)div:(Fraction*)fraction{
    self.numerator = self.numerator*fraction.denominator;
    self.denominator = self.denominator*fraction.numerator;
    [self reduction];
    return self;
}

-(float)transferToFloat{
    
    return self.numerator*1.0/self.denominator;
}

-(void)reduction {
    int temp = self.numerator<self.denominator?self.numerator:self.denominator;
    for (int i=temp; i>0; i--) {
        if (self.numerator%i==0&&self.denominator%i==0) {
            self.numerator = self.numerator/i;
            self.denominator = self.denominator/i;
            break;
        }
    }
}

-(void)show {
    NSLog(@"%d/%d=%g",self.numerator,self.denominator,[self transferToFloat]);
}


@end
