//
//  TRViewController.m
//  Day18PickImage
//
//  Created by tarena on 14-5-5.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
- (IBAction)clicked:(id)sender;
@property (nonatomic, strong)UIScrollView *mySV;
@property (nonatomic, strong)NSMutableArray *pickImages;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked:(id)sender {
    
    self.pickImages = [NSMutableArray array];
    UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
    [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    ipc.delegate = self;
    
    [self presentViewController:ipc animated:YES completion:nil];
  
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
 
//    0 80  160 240
//    0 1    2  3
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(self.pickImages.count*80, 0, 80, 80)];
    iv.image = image;
    [self.mySV addSubview:iv];
    [self.pickImages addObject:iv];
    //添加删除按钮
    UIButton *delBtn = [[UIButton alloc]initWithFrame:CGRectMake(60, 0, 20, 20)];
    [delBtn setTitle:@"X" forState:UIControlStateNormal];
    [delBtn addTarget:self action:@selector(deleteBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [iv addSubview:delBtn];
    
    iv.userInteractionEnabled = YES;
    
    [self.mySV setContentSize:CGSizeMake(80*self.pickImages.count, 0)];
    
}

- (void)deleteBtnAction:(UIButton*)btn{
    UIImageView *iv = (UIImageView*)btn.superview;
    //把数组和界面中的IV删除掉
    [self.pickImages removeObject:iv];
    [iv removeFromSuperview];
    
    
    [self updateSV];
    
    
}
- (void)updateSV{
    //根据更改完位置的数组 重新添加IV
    for (int i=0; i<self.pickImages.count; i++) {
        UIImageView *iv = self.pickImages[i];
        [UIView animateWithDuration:.5 animations:^{
               iv.frame = CGRectMake(80*i, 0, 80, 80);
        }];
     
    }
    //重新设置内容大小
    [self.mySV setContentSize:CGSizeMake(80*self.pickImages.count, 0)];
}
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (navigationController.viewControllers.count==2) {
        UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 468, 320, 100)];
        v.backgroundColor = [UIColor blueColor];
        [viewController.view addSubview:v];
        
        
        self.mySV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, 320, 80)];
        [v addSubview:self.mySV];
        self.mySV.backgroundColor = [UIColor yellowColor];
       
        UIButton *doneBtn = [[UIButton alloc]initWithFrame:CGRectMake(240, 0, 80, 20)];
        [doneBtn setTitle:@"Done" forState:UIControlStateNormal];
        [doneBtn addTarget:self action:@selector(doneAction) forControlEvents:UIControlEventTouchUpInside];
        [v addSubview:doneBtn];
        
    }
    
}
-(void)doneAction{
    [self dismissViewControllerAnimated:YES completion:Nil];
    
//    UIScrollView *sv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 200, 320, 100)];
//    [self.view addSubview:sv];
//    for (int i=0; i<self.pickImages.count; i++) {
//        UIImageView *iv = self.pickImages[i];
//        [sv addSubview:iv];
//    }
//    [self.view addSubview:sv];
    [self.view addSubview:self.mySV];
    self.mySV.frame = CGRectMake(0, 200, 320, 80);
}



@end
