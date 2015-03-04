//
//  TRPlayerViewController.m
//  Day14Team&Player
//
//  Created by tarena on 14-4-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPlayerViewController.h"
#import "Team.h"
#import "Player.h"
#import "TRAppDelegate.h"
@interface TRPlayerViewController ()
@property (nonatomic ,strong)NSArray *players;
@property (nonatomic, strong)Player *editPlayer;
@property (nonatomic, strong)TRAppDelegate *app;
@end

@implementation TRPlayerViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.app = [UIApplication sharedApplication].delegate;
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayer)];
    self.navigationItem.rightBarButtonItems = @[self.editButtonItem,addItem];
    self.title = self.team.name;
}



-(void)addPlayer{
    UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入球员名称" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertV setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alertV show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
           UITextField *tf = [alertView textFieldAtIndex:0];
        if (alertView.tag ==0) {
            Player *p = [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:self.app.managedObjectContext];
            p.name = tf.text;
            [self.team addPlayersObject:p];
          
        }else {//如果是编辑状态
            self.editPlayer.name = tf.text;
        }
        
        [self.app saveContext];
        [self.tableView reloadData];
        
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


//如果tableview reloadData 将会重新调用此方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    //把team中的set数组转成array数组 数组中添加了新数据 需要self.players数组也跟着更新
   self.players = self.team.players.allObjects;
    
    return self.team.players.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Player *p = self.players[indexPath.row];
    cell.textLabel.text = p.name;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Player *p = self.players[indexPath.row];
        
        [self.app.managedObjectContext deleteObject:p];
      
        [self.app saveContext];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请修改球员名称" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertV setAlertViewStyle:UIAlertViewStylePlainTextInput];
    alertV.tag = 1;//代表编辑
    UITextField *tf = [alertV textFieldAtIndex:0];
    
    Player *p = self.players[indexPath.row];
    tf.text = p.name;
    
    [alertV show];
    //把要编辑的Person 保存起来
    self.editPlayer = p;
    
}
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
