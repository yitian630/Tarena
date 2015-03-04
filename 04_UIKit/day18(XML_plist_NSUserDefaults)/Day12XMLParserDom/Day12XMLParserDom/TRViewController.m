//
//  TRViewController.m
//  Day12XMLParserDom
//
//  Created by tarena on 14-4-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TBXML.h"
#import "TRMusic.h"

@interface TRViewController ()
@property (nonatomic, strong)NSMutableArray *musics;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.musics = [NSMutableArray array];
    [self parse];
    
    for (TRMusic *music in self.musics) {
        NSLog(@"%@ %@ %@ %@",music.name,music.singerName,music.albumName,music.musicID);
    }
}

-(void)parse{
    NSData *data = [NSData dataWithContentsOfFile:@"/Users/tarena/Desktop/Day12XMLParserDom/Day12XMLParserDom/musics.xml"];
    NSError *err = Nil;
    //创建dom解析对象TBXML
    TBXML *tbXML = [[TBXML alloc]initWithXMLData:data error:&err];
    
    if (err) {
        NSLog(@"%@",[err localizedDescription]);
    }
    //得到最根一级别的元素
    TBXMLElement *rootEle = tbXML.rootXMLElement;
    
    if (rootEle) {
        //取到表示一首歌曲的元素
        TBXMLElement *musicEle = [TBXML childElementNamed:@"res" parentElement:rootEle];
        while (musicEle) {
            //通过歌曲元素 取到所有的子元素；
            TBXMLElement *nameEle = [TBXML childElementNamed:@"song" parentElement:musicEle];
            TBXMLElement *idEle = [TBXML childElementNamed:@"song_id" parentElement:musicEle];
            TBXMLElement *singerEle = [TBXML childElementNamed:@"singer" parentElement:musicEle];
            TBXMLElement *albumEle = [TBXML childElementNamed:@"album" parentElement:musicEle];
            
            NSString *name = [TBXML textForElement:nameEle];
            NSString *idStr = [TBXML textForElement:idEle];
            NSString *singer = [TBXML textForElement:singerEle];
            NSString *album = [TBXML textForElement:albumEle];
            TRMusic *music = [[TRMusic alloc]init];
            music.name = name;
            music.musicID = idStr;
            music.singerName = singer;
            music.albumName = album;
            [self.musics addObject:music];
            
            
            musicEle = [TBXML nextSiblingNamed:@"res" searchFromElement:musicEle];
        }
        
        
        
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
