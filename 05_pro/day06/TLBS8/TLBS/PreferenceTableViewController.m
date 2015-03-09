//
//  PreferenceTableViewController.m
//  TLBS-Project
//
//  Created by 123 on 13-12-25.
//  Copyright (c) 2013年 Wei WenRu. All rights reserved.
//

#import "PreferenceTableViewController.h"

 

@interface PreferenceTableViewController ()
@property (nonatomic, weak)TRAppDelegate *app;
@end

@implementation PreferenceTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.app =[UIApplication sharedApplication].delegate;
    [self setTitle:@"系统设置"];
  
    [self.logoutBtn setBackgroundImage:[UIImage imageNamed:@"tuichu_hover.png"] forState:UIControlStateHighlighted];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"dingwei.png"];
            cell.textLabel.text = @"搜索半径";
            break;
            
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"about.png"];
            cell.textLabel.text = @"关于TLBS";
            break;
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"搜索半径" message:@"请输入你要搜索的半径（“0”表示无限制）" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
            [alert setTag:indexPath.row];
            [alert show];
        }
            break;
        
        case 1:
        {
            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"关于TLBS" message:@"1111111111111" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
            [alert setTag:indexPath.row];
            [alert show];
        }
            break;
    }

    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1 && alertView.tag == 0) {
        [[NSUserDefaults standardUserDefaults]setObject:[alertView textFieldAtIndex:0].text forKey:@"Radius"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        NSLog(@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"Radius"]);
    }
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

- (IBAction)logout:(UIButton *)sender {
    [self.app.weiboApi cancelAuth];
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"提示" message:@"退出登录" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
    [av show];
}
@end
