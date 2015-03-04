//
//  TRTeamListViewController.m
//  Day14Team&Player
//
//  Created by tarena on 14-4-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRTeamListViewController.h"
#import "TRAppDelegate.h"
#import "TRPlayerViewController.h"
#import "TRTeamInfoViewController.h"
#import "Team.h"
@interface TRTeamListViewController ()
@property (nonatomic, weak)TRAppDelegate *app;
@property (nonatomic, strong)NSArray *teams;
@end

@implementation TRTeamListViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.app = [UIApplication sharedApplication].delegate;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"球队列表";
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Team"];
   //设置查询条件
//   [request setPredicate:[NSPredicate predicateWithFormat:@"name='rehuo'"]];
   //设置排序  后面的参数  升序
   [request setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]]];

    self.teams = [self.app.managedObjectContext executeFetchRequest:request error:Nil];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return self.teams.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Team *t = self.teams[indexPath.row];
    cell.textLabel.text = t.name;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    btn.tag = indexPath.row;
    [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.accessoryView = btn;
    
    return cell;
}
-(void)clicked:(UIButton*)btn{
    Team *t = self.teams[btn.tag];
    
    [self performSegueWithIdentifier:@"playerlistvc" sender:t];
    
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
        Team *t = self.teams[indexPath.row];
        [self.app.managedObjectContext deleteObject:t];
        [self.app saveContext];
        //更新以下数据源
        NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Team"];
        self.teams = [self.app.managedObjectContext executeFetchRequest:request error:Nil];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"teaminfovc" sender:self.teams[indexPath.row]];
}




#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
//如果点击+sender就是该barbuttonItem
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"teaminfovc"]) {
        if ([sender isMemberOfClass:[Team class]]) {
            TRTeamInfoViewController *vc = segue.destinationViewController;
            vc.editTeam = sender;
        }

    }else{//往球员列表跳转
        
        TRPlayerViewController *vc = segue.destinationViewController;
        
        vc.team = sender;
        
    }
    
}



@end
