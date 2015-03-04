//
//  TRViewController.m
//  Day12MusicList
//
//  Created by tarena on 14-4-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRMusic.h"
#import "TRCell.h"
@interface TRViewController ()
@property (nonatomic, strong)TRMusic *music;
@property (nonatomic, strong)NSMutableArray *musics;
@property (nonatomic, copy)NSString *currentString;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.musics = [NSMutableArray array];
    NSData *data = [NSData dataWithContentsOfFile:@"/Users/tarena/Desktop/Day12MusicList/Day12MusicList/music.xml"];
    
    
    NSXMLParser *parser = [[NSXMLParser alloc]initWithData:data];
    
    parser.delegate = self;
    [parser parse];
    
    
    
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"res"]) {
        self.music = [[TRMusic alloc]init];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    self.currentString = string;
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName isEqualToString:@"song"]) {
        self.music.name = self.currentString;
    } else if ([elementName isEqualToString:@"song_id"]) {
        self.music.musicID = self.currentString;
    }else if ([elementName isEqualToString:@"singer"]) {
        self.music.singerName = self.currentString;
    }else if ([elementName isEqualToString:@"album"]) {
        self.music.albumName = self.currentString;
    }else if ([elementName isEqualToString:@"res"]) {
        [self.musics addObject:self.music];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark tableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.musics.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    TRCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    TRMusic *music = self.musics[indexPath.row];
    cell.music = music;
    return cell;
}
@end
