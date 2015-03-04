//
//  main.m
//  Fraction
//
//  Created by tarena on 14-3-22.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Fraction *fran_1 = [[Fraction alloc]initWithNumerator:2 andDenominator:6];
        Fraction *fran_2 = [[Fraction alloc]initWithNumerator:3 andDenominator:6];
        [fran_1 add:fran_2];
        [fran_1 show];
        [fran_1 sub :fran_2];
        [fran_1 show];
        [fran_1 mul :fran_2];
        [fran_1 show];
        [fran_1 div  :fran_2];
        [fran_1 show];

        [fran_1 release];
        [fran_2 release];
        
    }
    return 0;
}

