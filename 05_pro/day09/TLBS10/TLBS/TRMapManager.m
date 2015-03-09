//
//  TRMapManager.m
//  TLBS
//
//  Created by tarena on 14-5-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMapManager.h"
static TRMapManager *_manager;
@implementation TRMapManager
+(TRMapManager *)shareManager {
    if (!_manager) {
        _manager = [[TRMapManager alloc]init];
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
-(void)createPoiWithLocation:(CLLocationCoordinate2D)location andWeiboID:(NSString *)weiboID{
    
    NSURL *url = [NSURL URLWithString:@"http://api.map.baidu.com/geodata/v3/poi/create"];
    NSString *params = [NSString stringWithFormat:@"ak=tByH8ctdq7532n2xXFspe53j&geotable_id=46576&tags=TLBS&latitude=%f&longitude=%f&coord_type=3&weibo_id=%@&title=newPOI",location.latitude,location.longitude,weiboID];
    NSLog(@"%@",params);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.myQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
        NSLog(@"添加位置信息 ：%@",[dic objectForKey:@"message"]);
    }];
}
-(void)serchPoiByLocation:(NSString *)location complation:(MyCallback)complation{
    //设置一个检索范围
    int radius = 1000000000;
    NSString *path = [NSString stringWithFormat:@"http://api.map.baidu.com/geosearch/v3/nearby?ak=tByH8ctdq7532n2xXFspe53j&geotable_id=46576&location=%@&radius=%d&coord_type=3&tags=TLBS&page_index=0&page_size=50",location,radius];
    
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:self.myQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
        NSLog(@"--%@",dic);
        
        NSArray *poiDics= [dic objectForKey:@"contents"];
        NSMutableArray *weiboIDs = [NSMutableArray array];
        for (NSDictionary *poiDic in poiDics) {
            NSString *weiboID = [poiDic objectForKey:@"weibo_id"];
            [weiboIDs addObject:weiboID];
        }
        
        complation(weiboIDs);
    }];
    
    
    
}
@end
