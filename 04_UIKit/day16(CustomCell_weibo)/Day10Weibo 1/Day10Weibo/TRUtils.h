/*
 1.创建WeiBo对象给对象添加imagePath、source、time、text、name属性
 2.创建自定义Cell 里面包含头像 名称 微博正文 时间 来源  把各种控件根代码进行关联
 3.创建一个工具类 添加一个获取所有微博对象的方法如：getAllWeibosByPath  返回数组（里面装weibo对象）
 4.在getAllWeibosByPath方法内部 遍历weibos文件夹 得到所有微博的文件夹  遍历每一个文件夹 获取文件下面的文件 head.jpg为头像图片  把info.rtf里面的字符串加载到内存 用换行符"\n"进行分割 得到里面的每一条数据   同时创建Weibo对象 给里面的属性赋值       最后返回一个装了所有Weibo对象的数组
 5.在ViewDidLoad里面通过工具类 得到所有的Weibo对象
 6.将每个weibo对象显示在每一个自定义的Cell里面，给自定义的Cell添加一个Weibo属性 在Cell的layoutsubviews方法里面自己控制自己显示的内容
 7.给Cell添加点击事件 点击时跳转页面 跳转时把Cell对应的Weibo对象传递到下一个页面
 */
//
//  TRUtils.h
//  Day9CustomTableHeaderView
//
//  Created by tarena on 14-4-23.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRWeibo.h"
@interface TRUtils : NSObject
+(NSMutableArray *)getAllWeibosByPath:(NSString *)path;
@end
