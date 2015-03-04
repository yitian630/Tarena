//
//  TRHostListViewController.m
//  Day23GameBegin
//
//  Created by tarena on 14-5-13.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRHostListViewController.h"

@interface TRHostListViewController ()
@property (nonatomic, strong)AsyncUdpSocket *myUDPSocket;
@property (nonatomic, strong)NSMutableArray *hosts;
@end

@implementation TRHostListViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.hosts = [NSMutableArray array];
    self.myUDPSocket = [[AsyncUdpSocket alloc]initWithDelegate:self];
    [self.myUDPSocket bindToPort:9000 error:Nil];
    [self.myUDPSocket enableBroadcast:YES error:Nil];
    
    [self.myUDPSocket receiveWithTimeout:-1 tag:0];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(checkingHosts) userInfo:Nil repeats:YES];
}

-(void)checkingHosts{
    [self.myUDPSocket sendData:[@"谁在线" dataUsingEncoding:NSUTF8StringEncoding] toHost:@"255.255.255.255" port:9000 withTimeout:-1 tag:0];
    
    
}


-(BOOL)onUdpSocket:(AsyncUdpSocket *)sock didReceiveData:(NSData *)data withTag:(long)tag fromHost:(NSString *)host port:(UInt16)port{
    [self.myUDPSocket receiveWithTimeout:-1 tag:0];
    if ([host hasPrefix:@":"]) {
        return YES;
    }
    
    NSString *receiveInfo = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    if ([receiveInfo isEqualToString:@"我在线"]) {
        if (![self.hosts containsObject:host]) {
            [self.hosts addObject:host];
            [self.tableView reloadData];
        }
    }else if ([receiveInfo isEqualToString:@"同意"]){
        [self performSegueWithIdentifier:@"beginGame" sender:Nil];
    }else if ([receiveInfo isEqualToString:@"不同意"]){//接收到不同意
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"%@拒绝了您的邀请",host] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:Nil, nil];
        [av show];
        
    }
    
    return YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return self.hosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@的游戏",self.hosts[indexPath.row]];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *host = self.hosts[indexPath.row];
    
    [self.myUDPSocket sendData:[@"请求开始" dataUsingEncoding:NSUTF8StringEncoding] toHost:host port:9000 withTimeout:-1 tag:0];
    
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
