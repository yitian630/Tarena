//
//  TRAlbumListViewController.m
//  Day4HomeWorkStoryboard
//
//  Created by tarena on 14-4-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRAlbumListViewController.h"
#import "TRAlbum.h"
#import "TRImageListViewController.h"
@interface TRAlbumListViewController ()
@property (nonatomic, strong)NSMutableArray *albums;
@end

@implementation TRAlbumListViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	 
    [self creatAlbums];
    
}

-(void)creatAlbums{
    self.albums = [NSMutableArray array];
    NSString *directoryPath = @"/Users/tarena/Desktop/美女";
    NSFileManager *fm = [NSFileManager defaultManager];
    //得到文件夹（相册）名称的数组
    NSArray *albumNames = [fm contentsOfDirectoryAtPath:directoryPath error:Nil];
    //遍历每一个文件夹（相册）名称
    for (NSString *albumName in albumNames) {
        //因为每一个文件夹在程序中都应该对应一个album对象 所以遍历每一个文件夹名册的时候都创建一个Album对象
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
           if ([imageName hasPrefix:@"."]) {
              continue;
           }
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
#pragma mark tableviewDelegate

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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    TRAlbum *album = self.albums[indexPath.row];
    [self performSegueWithIdentifier:@"imagelistvc" sender:album];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    TRImageListViewController *vc = segue.destinationViewController;
    vc.album = sender;
}

@end
