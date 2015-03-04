//
//  TRAlbumListViewController.m
//  Day4Homework
//
//  Created by tarena on 14-4-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRAlbumListViewController.h"
#import "TRAlbum.h"
@interface TRAlbumListViewController ()
@property (nonatomic, strong)NSMutableArray *albums;
@end

@implementation TRAlbumListViewController



- (void)viewDidLoad
{
    self.title = @"相册列表";
    [super viewDidLoad];
    self.albums = [NSMutableArray array];
    NSString *directoryPath = @"/Users/tarena/Desktop/美女";
    NSFileManager *fm = [NSFileManager defaultManager];
    //得到文件夹（相册）名称的数组
    NSArray *albumNames = [fm contentsOfDirectoryAtPath:directoryPath error:Nil];
    //遍历每一个文件夹（相册）名称
    for (NSString *albumName in albumNames) {
        //因为每一个文件夹在程序中都应该对应一个album对象 所以遍历每一个文件夹名称的时候都创建一个Album对象
        if ([albumName hasPrefix:@"."]) {
//            break;//跳出当前循环
//            return;//结束当前方法
            continue;//结束当前循环 进入下次循环
        }
        TRAlbum *album = [[TRAlbum alloc]init];
        album.name = albumName;
        album.path = [directoryPath stringByAppendingPathComponent:albumName];
        //得到文件夹下面所有的图片名称
        NSArray *imageNames = [fm contentsOfDirectoryAtPath:album.path error:Nil];
        //遍历每一个图片的名称
        for (NSString *imageName in imageNames) {
            //得到图片的完整路径
            NSString *imagePath = [album.path stringByAppendingPathComponent:imageName];
            [album.imagePaths addObject:imagePath];
            
        }
        
        //把所有的album对象都装进数组
        [self.albums addObject:album];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return self.albums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //取到和这一行对应的album对象
    TRAlbum *album = self.albums[indexPath.row];
    cell.textLabel.text = album.name;
    //把album对象中的第一张图片取到
    cell.imageView.image = [UIImage imageWithContentsOfFile:album.imagePaths[0]];
    
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
