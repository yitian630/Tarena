//
//  TRMusicListViewController.m
//  Day15MusicList
//
//  Created by tarena on 14-4-29.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMusicListViewController.h"

@interface TRMusicListViewController ()
@property (nonatomic, strong)NSMutableArray *musics;
@end

@implementation TRMusicListViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.musics = [NSMutableArray array];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:@"/Users/tarena/Desktop/musics" error:Nil];
    
    for (NSString *fileName in fileNames) {
        if ([fileName hasSuffix:@"mp3"]) {
            NSString *filePath = [@"/Users/tarena/Desktop/musics" stringByAppendingPathComponent:fileName];
            
            [self.musics addObject:filePath];
        }
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return self.musics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *musicPath =self.musics[indexPath.row];
    NSString *musicName = [musicPath lastPathComponent];
    cell.textLabel.text = [musicName substringToIndex:musicName.length-4];
    
   
    
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