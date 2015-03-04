//
//  TRViewController.m
//  Day3FileManager
//
//  Created by tarena on 14-4-11.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic, strong)NSMutableArray *imagePaths;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    //初始化数组
    self.imagePaths = [NSMutableArray array];
    [super viewDidLoad];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *directoryPath = @"/Users/tarena/Desktop/Desktop Pictures";
    //获得文件夹里面的文件和文件夹
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:directoryPath error:Nil];
   
    for (NSString *fileName in fileNames) {
       
//        [fileName rangeOfString:@"jpg"].length>0 判断是否包含某个字符串
        if ([fileName hasSuffix:@"jpg"]) {
            NSString *imagePath = [directoryPath stringByAppendingPathComponent:fileName];
            [self.imagePaths addObject:imagePath];
            NSLog(@"%@",imagePath);
        }
       
        
    }
    
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.imagePaths.count;
}
//询问当前这一行显示什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    //取到当前这一行对应的图片路径
    NSString *imagePath = self.imagePaths[indexPath.row];
    //通过图片路径得到图片
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    cell.imageView.image = image;
    //把图片名称显示出来
    cell.textLabel.text = [imagePath lastPathComponent];
    
    
    return cell;
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
