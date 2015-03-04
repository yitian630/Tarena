//
//  TRViewController.m
//  Day11FileHandleReadImage
//
//  Created by tarena on 14-4-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic, strong)NSMutableData *fileData;
@property (nonatomic, strong)NSFileHandle *readFH;
@property (nonatomic, strong)UIImageView *iv;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.iv = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.iv];
    
    
    
    self.fileData = [NSMutableData data];
    
    self.readFH = [NSFileHandle fileHandleForReadingAtPath:@"/Users/tarena/Downloads/Day15PhotoRiver/Day15PhotoRiver/美女/5.jpg"];
    [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(readData:) userInfo:Nil repeats:YES];

}
-(void)readData:(NSTimer*)timer{
    
   
    //读取100个字节的数据
    NSData *subData = [self.readFH readDataOfLength:100];
    if (subData.length == 0) {
        [timer invalidate];
    }
    [self.fileData appendData:subData];
    UIImage *image = [UIImage imageWithData:self.fileData];
    self.iv.image = image;
    
}


@end
