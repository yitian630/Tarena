//
//  TRHomeViewController.m
//  TLBS
//
//  Created by tarena on 14-3-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
#import "Weibo.h"
#import "WeiboCell.h"
#import "MapViewController.h"
#import "TRHomeViewController.h"
#import "TRMyWeiboApi.h"
#import "TRWeiboManager.h"
#import "UIViewExt.h"
#import "TRMapManager.h"
@interface TRHomeViewController ()
@property (nonatomic, strong)NSMutableArray *weibos;
@end

@implementation TRHomeViewController



- (void)viewDidLoad
{
    
    [super viewDidLoad];

    [self initBarUI];
    
}
-(void)viewDidAppear:(BOOL)animated{
    //此时代码相当于等待了一小会儿 等完之后 登陆就能够进行完成了 所以第二次再调用就不会出授权页面了
    dispatch_async(dispatch_get_main_queue(), ^{
        //登陆代码
        [[TRMyWeiboApi shareWeiboApi] loginWithDelegate:self andRootController:self];
    });
    
    //跟好友微博列表复用页面 判断此页面显示的是什么
    if (self.currentUserInfo) {
        self.title = self.currentUserInfo.nick;
        //隐藏tabbar按钮
        self.navigationItem.leftBarButtonItems = nil;
        self.navigationItem.rightBarButtonItem = nil;
        
        [[TRWeiboManager shareManager]getUserTimelineByOpenid:self.currentUserInfo.openid complation:^(id obj) {
            self.weibos = obj;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }];
    }else{//else里面处理附近微博的逻辑
        [self loadNearByWeibos];
    }

}
-(void)loadNearByWeibos{
    //因为真机获取不到经纬度 创建一个默认的位置
    CLLocationCoordinate2D l;
    l.latitude =39.904965;
    l.longitude =116.406636;
    NSString *location = [NSString stringWithFormat:@"%f,%f",l.longitude,l.latitude];
    //给百度发请求获取weiboID
    [[TRMapManager shareManager]serchPoiByLocation:location complation:^(id obj) {
        NSArray *weiboIDs = obj;
        if (weiboIDs.count!=0) {
            
            //向腾讯发请求通过weiboID获得Weibo对象
            [[TRWeiboManager shareManager]getWeibosByweiboIDs:weiboIDs complation:^(id obj) {
                self.weibos = obj;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }];
        }
    }];

}



-(void)initBarUI{

    UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshAction)];
    [refreshItem setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.leftBarButtonItems = @[self.navigationItem.leftBarButtonItem,refreshItem];
    

}
-(void)refreshAction{
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - weibo
- (void)DidAuthFinished:(WeiboApiObject *)wbobj
{
    NSLog(@"授权成功！！");
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"weibo count = %d",self.weibos.count);
    return self.weibos.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Weibo *w = self.weibos[indexPath.row];
    return [w getHeight] + 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Weibo *weibo = [self.weibos objectAtIndex:indexPath.row];
    cell.weibo = weibo;
    cell.delegate = self;
    return cell;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"mapvc"]) {
        MapViewController *vc = segue.destinationViewController;
        vc.weibos = self.weibos;
    }
    
}

@end
