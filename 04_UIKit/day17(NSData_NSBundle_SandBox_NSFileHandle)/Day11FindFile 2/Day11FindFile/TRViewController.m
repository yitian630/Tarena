//
//  TRViewController.m
//  Day11FindFile
//
//  Created by tarena on 14-4-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
- (IBAction)clicked:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UITextField *myTF;
@property (nonatomic)int fileCount;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

-(void)findFileByPath:(NSString *)path{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:path error:Nil];
    
    for (NSString *fileName in fileNames) {
        NSString *filePath = [path stringByAppendingPathComponent:fileName];
        BOOL isDir;
        //判断是否是文件夹
        if ([fm fileExistsAtPath:filePath isDirectory:&isDir]&& isDir) {
            [self findFileByPath:filePath];
        }else{//如果是文件
            
            //是否是模糊查找
            if (self.mySwitch.isOn) {//是模糊查找
                //判断文件名称中是否包含要查询的字符串
                if ([fileName rangeOfString:self.myTF.text].length>0) {
                    [fm copyItemAtPath:filePath toPath:[@"/Users/tarena/Desktop/未命名文件夹" stringByAppendingPathComponent:fileName] error:Nil];
                }
                
            }else{//不是模糊查找
                if ([fileName isEqualToString:self.myTF.text]) {
                    //拷贝文件到新的文件夹
                       [fm copyItemAtPath:filePath toPath:[@"/Users/tarena/Desktop/未命名文件夹" stringByAppendingPathComponent:fileName] error:Nil];
                }
            }
            
        }
        
        
    }
    
    
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked:(id)sender {
    [self findFileByPath:@"/Users/"];
}
@end
