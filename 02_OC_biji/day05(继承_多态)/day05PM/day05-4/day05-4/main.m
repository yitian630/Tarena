//
//  main.m
//  day05-4
//
//  Created by tarena on 14-3-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBike.h"
#import "TRBus.h"
#import "TRTaxi.h"
#import "TRTransportation.h"
#import "TRStudent.h"
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        //C中的数组
        TRTransportation* trans[5];
        TRTransportation* tran1 = [[TRBus alloc]init];
        //[tran1 print];
        trans[0] = tran1;
        TRTransportation* tran2 = [[TRBus alloc]init];
        //[tran2 print];
        trans[1] = tran2;
        TRTransportation* tran3 = [[TRTaxi alloc]init];
        //[tran3 print];
        trans[2] = tran3;
        TRTransportation* tran4 = [[TRTaxi alloc]init];
        //[tran4 print];
        trans[3] = tran4;
        TRTransportation* tran5 = [[TRBike alloc]init];
        //[tran5 print];
        trans[4] = tran5;
        //遍历数组中的元素
        for (int i = 0; i < 5; i++) {
            [trans[i] print];
        }
        
        //创建三个学生对象
        TRStudent* stu = [[TRStudent alloc]init];
        stu.age = 10;
        [stu gotoSchoolByTransportation:tran1];
        TRStudent* stu2 = [[TRStudent alloc]init];
        stu2.age = 12;
        //通过工厂方法得到对象
        //多态用做返回值类型中
        TRTransportation* tran = [TRTransportation transportationByNum:1];
        //多态用在参数中
        [stu2 gotoSchoolByTransportation:tran];
        
    }
    return 0;
}

