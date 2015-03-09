//
//  TRViewController.m
//  Day9Refresh
//
//  Created by tarena on 14-5-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic, strong)NSMutableArray *names;
@end

@implementation TRViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.names = [NSMutableArray arrayWithObjects:@"张三",@"李四",@"张三",@"李四",@"张三",@"李四",@"张三",@"李四",@"张三",@"李四",@"张三",@"李四",@"张三",@"李四",@"张三",@"李四",@"张三",@"李四", nil];
    
//    添加下拉刷新
    UIRefreshControl *rc = [[UIRefreshControl alloc]init];
    
    [rc addTarget:self action:@selector(refreshAction:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = rc;
}
-(void)refreshAction:(UIRefreshControl *)rc{
    NSLog(@"开始刷新");
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        [NSThread sleepForTimeInterval:2];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.names addObject:@"哈哈"];
            [self.tableView reloadData];
            //tableview弹回
            [rc endRefreshing];
        });
        
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
 
    return self.names.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.names[indexPath.row];
    
    
//    判断显示到了最后一行
    if (indexPath.row==self.names.count-1) {
        [self loadMoreInfo];
    }
    return cell;
}

-(void)loadMoreInfo{
    for (int i=0; i<10; i++) {
        [self.names addObject:[NSString stringWithFormat:@"名字%d",i]];
    }
    [self.tableView reloadData];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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
