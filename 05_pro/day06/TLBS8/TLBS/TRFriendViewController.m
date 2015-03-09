//
//  TRFriendViewController.m
//  TLBS
//
//  Created by tarena on 14-3-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRFriendViewController.h"
#import "UserInfoViewController.h"
#import "TRAppDelegate.h"
#import "TRMyWeiboApi.h"
#import "TRWeiboManager.h"

#import "UserInfoCell.h"
@interface TRFriendViewController ()
@property (nonatomic, weak)TRAppDelegate *app;
@property (nonatomic, copy)NSString *listID;
@property (nonatomic, strong)NSMutableArray *requests;
@property (nonatomic, strong)NSMutableArray *users;
@end

@implementation TRFriendViewController
- (IBAction)addFriend:(id)sender {
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"添加好友" message:@"请输入好友的name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Sure", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {//添加好友
        NSString* userName = [alertView textFieldAtIndex:0].text;
        
        [[TRWeiboManager shareManager] addFriendByName:userName AndComplation:^(id obj) {
            
            [self findFriends];
        }];
    }
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self findFriends];
    
    
}
-(void)findFriends{
    //查询好友列表
    TRWeiboManager *manager = [TRWeiboManager shareManager];
    [manager getFriends:^(id obj) {
        
        self.users = [obj mutableCopy];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];

}

-(void)viewDidAppear:(BOOL)animated{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[TRMyWeiboApi shareWeiboApi] loginWithDelegate:self andRootController:self];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UserInfoCell *cell = (UserInfoCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    cell.userInfo = self.users[indexPath.row];
    
    return cell;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //删除好友
        UserInfo *user = self.users[indexPath.row];
        [[TRWeiboManager shareManager]deleteUserByName:user.name];
        [self.users removeObject:user];
        
        
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


//选中某一行的时候跳转到查看信息的页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UserInfoViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"UserInfoViewController"];
    UserInfo *user = self.users[indexPath.row];
    vc.userName = user.name;
    [self.navigationController pushViewController:vc animated:YES];
    
}





@end
