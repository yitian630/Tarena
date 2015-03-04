//
//  TRViewController.m
//  Day11FileList
//
//  Created by tarena on 14-4-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic, copy)NSString *currentDirecotryPath;
@property (nonatomic, strong)NSMutableArray *filePaths;
@end

@implementation TRViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    if (!self.currentDirecotryPath) {
        //第一次运行 显示users下面的数据
        self.currentDirecotryPath = @"/Users/";
    }
    self.title = [self.currentDirecotryPath lastPathComponent];
    self.filePaths = [NSMutableArray array];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:self.currentDirecotryPath error:Nil];
    
    for (NSString *fileName in fileNames) {
        if ([fileName hasPrefix:@"."]) {
            continue;
        }
        NSString *filePath = [self.currentDirecotryPath stringByAppendingPathComponent:fileName];
        [self.filePaths addObject:filePath];
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
 
    return self.filePaths.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *filePath = self.filePaths[indexPath.row];
    //把文件名称显示出来
    cell.textLabel.text = [filePath lastPathComponent];
    NSFileManager *fm = [NSFileManager defaultManager];
    //判断是否是文件夹
    BOOL isDir;
    if ([fm fileExistsAtPath:filePath isDirectory:&isDir]&&isDir) {
        
        cell.imageView.image = [UIImage imageNamed:@"directory.png"];
         [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    //如果是图片就显示图片的缩略图
    if ([filePath hasSuffix:@"jpg"]) {
        cell.imageView.image = [UIImage imageWithContentsOfFile:filePath];
    }
   
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *filePath = self.filePaths[indexPath.row];
  
    NSFileManager *fm = [NSFileManager defaultManager];
    //判断是否是文件夹
    BOOL isDir;
    if ([fm fileExistsAtPath:filePath isDirectory:&isDir]&&isDir) {
       //通过storyboard创建当前页面
        TRViewController *nextVC = [self.storyboard instantiateViewControllerWithIdentifier:@"filelistvc"];
        nextVC.currentDirecotryPath = filePath;
        [self.navigationController pushViewController:nextVC animated:YES];
        
    }
    
    //如果点击了文本文件 就跳转到一个新的页面去显示该文本
    if ([filePath hasSuffix:@"txt"]||[filePath hasSuffix:@"h"]||[filePath hasSuffix:@"m"]) {
        UIViewController *vc = [[UIViewController alloc]init];
        UITextView *tv = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
        tv.text = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:Nil];
        [vc.view addSubview:tv];
        
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }
    
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    //判断是否是文件夹 如果是 那就不能编辑
    NSString *filePath = self.filePaths[indexPath.row];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    //判断是否是文件夹
    BOOL isDir;
    if ([fm fileExistsAtPath:filePath isDirectory:&isDir]&&isDir) {
     
        return NO;
    }
    
    return YES;
}
 


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSString *filePath = self.filePaths[indexPath.row];
        NSFileManager *fm = [NSFileManager defaultManager];
        [fm removeItemAtPath:filePath error:Nil];
        
        [self.filePaths removeObject:filePath];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
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
