//
//  TRMusicListViewController.m
//  Day15MusicList
//
//  Created by tarena on 14-4-29.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMusicListViewController.h"
#import "TRViewController.h"

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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"playvc" sender:@(indexPath.row)];
}



#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    TRViewController *vc = segue.destinationViewController;
    vc.currentIndex = [sender intValue];
    vc.musics = self.musics;
}



@end
