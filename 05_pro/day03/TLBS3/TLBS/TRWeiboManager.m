//
//  TRWeiboManager.m
//  TLBS
//
//  Created by tarena on 14-5-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRWeiboManager.h"
#import "TRMyWeiboApi.h"
#import "WeiboPaser.h"
static TRWeiboManager *_manager;
@implementation TRWeiboManager
+(TRWeiboManager *)shareManager{
    if (!_manager) {
        _manager = [[TRWeiboManager alloc]init];
    }
    return _manager;
}
- (id)init
{
    self = [super init];
    if (self) {
        self.myQueue = [[NSOperationQueue alloc]init];
    }
    return self;
}

-(NSString *)normalParams{
    if (!_normalParams) {
        WeiboApi *weiboApi = [TRMyWeiboApi shareWeiboApi];
        WeiboApiObject *weiboObj = [weiboApi getToken];
        
        _normalParams = [NSString stringWithFormat:@"?accesstoken=%@&openid=%@&appkey=%@&appsecret=%@",weiboObj.accessToken,weiboObj.openid,weiboObj.appKey,weiboObj.appSecret];
    }
    return _normalParams;
}



-(void)getUserInfo:(MyCallback)complation{
    
    NSString *path = [NSString stringWithFormat:@"%@user/info%@&format=json",BASE_URL,self.normalParams];
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
   
     [NSURLConnection sendAsynchronousRequest:request queue:self.myQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
      
        
        NSDictionary *userInfoDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
        
        UserInfo *userInfo = [WeiboPaser paseUserInfoByDictionary:userInfoDic];
        
        complation(userInfo);
        
    }];

}
-(void)createList:(MyCallback)complation{
   
    NSString *path = [NSString stringWithFormat:@"%@list/create",BASE_URL];
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    
     NSString *params = [NSString stringWithFormat:@"%@&format=json&tag=TLBS&access=1&name=我的名单&description=微身边专用",self.normalParams];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    [NSURLConnection sendAsynchronousRequest:request queue:self.myQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    
        NSDictionary *listDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
        NSString *listID = [WeiboPaser paseListIDByDic:listDic];
        
        complation(listID);
    }];
}
//获取名单列表
-(void)requestListID:(MyCallback)complation{
    NSString *path = [NSString stringWithFormat:@"%@list/get_list%@&format=json",BASE_URL,self.normalParams];
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.myQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSDictionary *listsDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
        
        NSArray *lists = [WeiboPaser paseListsByJsonDic:listsDic];
        if (lists.count==0) {//如果没有名单
            
            [self createList:^(id obj) {
                
                complation(obj);
            }];
            
        }else{//如果有名单
            NSDictionary *listDic = lists[0];
            
            NSString *listid = [listDic objectForKey:@"listid"];
            complation(listid);
        }
      
    }];

    
    
}
-(void)getFriends:(MyCallback)complation{
    //如果有名单id就直接查询
    if (self.listID) {
        NSString *path = [NSString stringWithFormat:@"%@list/listusers%@&format=json&pageflag=0&listid=%@",BASE_URL,self.normalParams,self.listID];
        NSURL *url = [NSURL URLWithString:path];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        
        [NSURLConnection sendAsynchronousRequest:request queue:self.myQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            
            
            
            NSDictionary *usersDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
            
            NSArray *users = [WeiboPaser paseAllUserByJsonDic:usersDic];
            complation(users);
        }];

    }else{//如果没有名单的id 需要获取一下
        
        [self requestListID:^(id obj) {
            self.listID = obj;
            //得到名单id之后需要继续查询好友列表 这样的话调用一下自身方法即可
            [self getFriends:complation];
        }];
    }
    
    
}


@end
