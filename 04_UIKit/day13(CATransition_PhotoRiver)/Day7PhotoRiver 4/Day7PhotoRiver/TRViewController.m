//
//  TRViewController.m
//  Day7PhotoRiver
//
//  Created by tarena on 14-4-17.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRPhoto.h"
@interface TRViewController ()
@property (nonatomic, strong)NSMutableArray *photos;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.photos = [NSMutableArray array];
    NSMutableArray *imagePaths = [NSMutableArray array];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *path =@"/Users/tarena/Desktop/美女/美女";
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:path error:Nil];
    for (NSString *fileName in fileNames) {
        if ([fileName hasSuffix:@"jpg"]) {
              NSString *imagePath = [path stringByAppendingPathComponent:fileName];
            [imagePaths addObject:imagePath];
        }
       
    }
    
    //添加9张图片
    
    for ( int i=0; i<9; i++) {
        TRPhoto *p = [[TRPhoto alloc]initWithFrame:CGRectZero andImagePaths:imagePaths];
        [self.view addSubview:p];
        [self.photos addObject:p];
    }
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)twoTapAction:(UITapGestureRecognizer *)sender {
    TRPhoto *photo = self.photos[0];
    
   [UIView animateWithDuration:1 animations:^{
       if (photo.tag == 3) {//如果等于三说明已经集合了 需要散开
           for (int i=0; i<9; i++) {
               TRPhoto *p = self.photos[i];
               p.speed = p.oldSpeed;
               p.alpha = p.oldAlpha;
               p.frame = p.oldFrame;
               p.dv.frame = p.bounds;
               p.iv.frame = p.bounds;
               //恢复原来状态
               p.tag = 0;
           }
       }else{//没有集合 那就集合
           for (int i=0; i<9; i++) {
               TRPhoto *p = self.photos[i];
               p.oldSpeed = p.speed;
               p.oldFrame = p.frame;
               p.oldAlpha = p.alpha;
               p.tag = 3;
               p.speed = 0;
               p.alpha = 1;
               p.frame = CGRectMake(i%3*107, i/3*150, 107, 150);
               p.dv.frame = p.bounds;
               p.iv.frame = p.bounds;
           }
           
       }
 
   }];
    
    
    
    
}

@end
