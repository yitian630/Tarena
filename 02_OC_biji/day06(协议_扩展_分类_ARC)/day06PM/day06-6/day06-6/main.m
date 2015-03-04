//
//  main.m
//  day06-6
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRJdbc.h"
#import "TRMysql.h"
#import "TROracle.h"
#import "TRSqlServer.h"
#import "TRButtonProtocol.h"
#import "TRButton.h"
#import "TRButton2.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //低耦合(多态相似)
        id<TRJdbc> dao = [[TRMysql alloc]init];
        [dao connection];
        [dao select];
        [dao close];
        
        id<TRButtonProtocol> button1 = [[TRButton alloc]init];
        [button1 onClick];
        id<TRButtonProtocol> button2 =[[TRButton2 alloc]init];
        [button2 onClick];
    }
    return 0;
}






