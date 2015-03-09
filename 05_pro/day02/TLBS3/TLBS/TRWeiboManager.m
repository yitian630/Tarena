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
//2.创建单例
static TRWeiboManager *_manager;
@implementation TRWeiboManager
//3.创建单例
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
      NSLog(@"weiboObj:%@",weiboObj);
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


@end
