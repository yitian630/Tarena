//
//  TRStudent.h
//  day04-4
//
//  Created by tarena on 14-3-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject
{
    int _age;//公开的实例变量 默认是protected
    @public //所有文件都可以访问
        int i;
    @package //只能在当前项目中访问
        int i2;
    @protected //只能本类或子类访问
        int i3;
    @private //只能本类中访问
        int i4;
}
-(void)showI;
@end




