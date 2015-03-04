//
//  TRPerson+TREquipment.h
//  day06-2
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPerson.h"
            //主类类名   分类类名
@interface TRPerson (TREquipment)
{
    //int _age;
}
//@property int age;
//分类中不能创建实例变量，自然也不能创建属性
//添加飞的能力
-(void)fly;
//添加攻击的能力
-(void)fire;
@end




