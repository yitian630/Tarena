//
//  TRWeiboManager.m
//  TLBS
//
//  Created by tarena on 14-5-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRWeiboManager.h"
#import "TRMyWeiboApi.h"
#import "Comment.h"
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
-(void)deleteUserByName:(NSString *)name{
    NSString *path = [NSString stringWithFormat:@"%@list/del_from_list",BASE_URL];
    NSString *params = [NSString stringWithFormat:@"%@&format=json&names=%@&listid=%@",self.normalParams,name,self.listID];
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.myQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
        NSLog(@"删除好友：%@",[dic objectForKey:@"msg"]);
    }];

}
-(void)getUserInfoByName:(NSString *)userName complation:(MyCallback)complation{
    
    NSString *path = [NSString stringWithFormat:@"%@user/other_info%@&format=json&name=%@",BASE_URL,self.normalParams,userName];
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
            NSLog(@"%@",listid);
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
-(void)addFriendByName:(NSString *)name AndComplation:(MyCallback)complation{
    
    
    NSString *path = [NSString stringWithFormat:@"%@list/add_to_list",BASE_URL];
    NSString *params = [NSString stringWithFormat:@"%@&format=json&names=%@&listid=%@",self.normalParams,name,self.listID];
    
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.myQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSDictionary *listsDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
        complation(listsDic);
    }];
}

//获取用户所发微博接口
-(void)getUserTimelineByOpenid:(NSString *)openid complation:(MyCallback)complation{
 
    NSString *path = [NSString stringWithFormat:@"%@statuses/user_timeline",BASE_URL];
//    get和post区别
//    默认是get请求
//    get请求方式：把请求参数放在请求地址的后面
//    post请求方式：把请求参数放在httpbody里面 还需要设置一下请求方式
    NSString *params = [NSString stringWithFormat:@"%@&format=json&fopenid=%@&listid=0&reqnum=20&pageflag=0&type=0&contenttype=0&pageTime=0",self.normalParams,openid];
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.myQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //服务器返回数据时调回这里
        NSDictionary *listsDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
        
        NSDictionary *dic = [listsDic objectForKey:@"data"];
        NSArray *weibosDic = [dic objectForKey:@"info"];
        NSMutableArray *weibos = [NSMutableArray array];
        for (NSDictionary *weiboDic in weibosDic) {
            Weibo *w = [WeiboPaser paseWeiboByDictionary:weiboDic];
            [weibos addObject:w];
        }
        complation(weibos);
        
    }];
}

-(void)getCommentsByWeiboID:(NSString *)weiboID complation:(MyCallback)complation{
    
    NSString *path = [NSString stringWithFormat:@"%@t/re_list%@&format=json&flag=2&rootid=%@&reqnum=100&pagetime=0&pageflag=0&",BASE_URL,self.normalParams,weiboID];
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.myQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
        NSDictionary *dataDic = [dic objectForKey:@"data"];
        if ([dataDic isMemberOfClass:[NSNull class]]) {
            return ;
        }
        NSArray *commentsDic = [dataDic objectForKey:@"info"];
        NSMutableArray *comments =[NSMutableArray array];
        for (NSDictionary *commentDic in commentsDic) {
            Comment *c = [WeiboPaser paseCommentsByDictionary:commentDic];
            [comments addObject:c];
            
        }
        complation(comments);
    }];

}

-(void)addCommentsByInfo:(NSString *)infoString andWeiboID:(NSString *)weiboID complation:(MyCallback)complation{

    
    
    NSString *path = [NSString stringWithFormat:@"%@t/comment",BASE_URL];
    NSString *params = [NSString stringWithFormat:@"%@&format=json&rootid=%@&syncflag=0&compatiblefalg=0&reid=%@&content=%@",self.normalParams,weiboID,weiboID,infoString];
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.myQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //服务器返回数据时调回这里从这里可以判断是否评论成功
        complation(@"");
        
    }];
    
    
}

-(void)getWeibosByweiboIDs:(NSArray *)weiboIDs complation:(MyCallback)complation{
        NSString *weiboIDsString = [weiboIDs componentsJoinedByString:@","];
    
    NSString *path = [NSString stringWithFormat:@"%@t/list%@&format=json&ids=%@",BASE_URL,self.normalParams,weiboIDsString];
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.myQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
        NSDictionary *dataDic = [dic objectForKey:@"data"];
        if ([dataDic isMemberOfClass:[NSNull class]]) {
            complation(Nil);
        }
        NSMutableArray *weibos = [NSMutableArray array];
        NSArray *weiboDics = [dataDic objectForKey:@"info"];
        for (NSDictionary *weiboDic in weiboDics) {
            Weibo *w = [WeiboPaser paseWeiboByDictionary:weiboDic];
            [weibos addObject:w];
        }
        complation(weibos);
    }];

    
    
}
@end
