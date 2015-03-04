//
//  TRServerFileListViewController.m
//  Day22ServerFile
//
//  Created by tarena on 14-5-12.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRServerFileListViewController.h"
#import "TRUtils.h"
#import "TRFile.h"
@interface TRServerFileListViewController ()
@property (nonatomic, strong)AsyncSocket *clientSocket;
@property (nonatomic, strong)NSArray *files;
@end

@implementation TRServerFileListViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    self.clientSocket = [[AsyncSocket alloc]initWithDelegate:self];
    
    [self.clientSocket connectToHost:@"对方ip" onPort:8000 error:Nil];
    
    NSString *headerString = @"getList&& &&";
    NSMutableData *data = [TRUtils getAllDataByHeaderString:headerString];
    
    [self.clientSocket writeData:data withTimeout:-1 tag:0];
    
    [self.clientSocket readDataWithTimeout:-1 tag:0];
    
}

-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    
    //反归档把files得到
    NSKeyedUnarchiver *unArch = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    self.files = [unArch decodeObjectForKey:@"files"];
    
    //接收到数据后刷新tableView
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
 
    return self.files.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    TRFile *f = self.files[indexPath.row];
    cell.textLabel.text = f.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%dkb",f.length/1024];
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
