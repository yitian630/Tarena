//
//  TRViewController.m
//  Day9GameResult
//
//  Created by tarena on 14-4-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSArray *results = @[@"4",@"3",@"4",@"3",@"4",@"3",@"4",@"4"];
   
    int maxCount = [self getMaxCount:results];
    
    switch (maxCount) {
        case 3:
            <#statements#>
            break;
            
        default:
            break;
    }
}

-(int)getMaxCount:(NSArray *)results{
    int maxCount = 0;
    NSString *maxNumber = nil;
    //找出出现次数最多的数 和出现了多少次
    for (NSString *number1 in results) {
        int count = 0;
        
        for (NSString *number2 in results) {
            //把当前的数number1 和数组中每一个数去做比较 如果相等 表示出现一次
            if (number1.intValue == number2.intValue) {
                count++;
            }
        }
        //遍历完之后 得到这个数的出现次数 和出现的最大次数做比较 如果这次的大 那就把这次的出现次数记录为最大次数
        if (count>maxCount) {
            maxCount = count;
            maxNumber = number1;
        }
    }
    
    NSLog(@"最大次数%d    %@",maxCount,maxNumber);
    
    return maxCount;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
