//
//  main.m
//  protocol
//
//  Created by tarena on 14-3-29.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRLamp.h"
#import "TRBulb.h"
#import "TRRed.h"
#import "TRBlue.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        TRLamp *lamp = [[TRLamp alloc]init];
        TRBulb *bulb = [[TRBulb alloc]init];
//        lamp.bulb = bulb;
//        [lamp powerOn];
        
//        [lamp powerOn:bulb];
//        lamp.bulb = bulb;
        [lamp powerOn:bulb];
        TRRed *red = [[TRRed alloc]init];
//        lamp.bulb = red;
        [lamp powerOn:red];
        TRBlue *blue = [[TRBlue alloc]init];
//        lamp.bulb = blue;
        [lamp powerOn:blue];
    }
    return 0;
}

