//
//  TRLocalFileListViewController.m
//  Day22ServerFile
//
//  Created by tarena on 14-5-12.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRLocalFileListViewController.h"
#import "TRUtils.h"
#import "TRFile.h"
@interface TRLocalFileListViewController ()
@property (nonatomic, strong)NSMutableArray *files;
@property (nonatomic, strong)AsyncSocket *clientSocket;
@end

@implementation TRLocalFileListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.files = [TRUtils getFilesByDirectoryPath:@"/Users/tarena/Desktop/上传文件"];
    
    self.clientSocket = [[AsyncSocket alloc]initWithDelegate:self];
    [self.clientSocket connectToHost:@"对方IP" onPort:8000 error:Nil];

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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TRFile *file = self.files[indexPath.row];
    NSString *headerString = [NSString stringWithFormat:@"upload&&%@&&%d",file.name,file.length];
    
    NSMutableData *allData = [TRUtils getAllDataByHeaderString:headerString];
    
    NSData *fileData = [NSData dataWithContentsOfFile:file.path];
    [allData appendData:fileData];
    [self.clientSocket writeData:allData withTimeout:-1 tag:0];
}

-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag{
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"提示" message:@"文件上传完成" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:Nil, nil];
    [av show];
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
