//
//  TRViewController.m
//  Day18UImagePicker
//
//  Created by tarena on 14-5-5.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic, strong)UIView *v;
@end

@implementation TRViewController
- (IBAction)clicked:(id)sender {
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
    ipc.delegate = self;
    //设置图片来源
    [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    //设置是否允许编辑
//    ipc.allowsEditing = YES;
    [self presentViewController:ipc animated:YES completion:Nil];
    
    
}
//当选择某一张图片的时候会调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"%@",info);
//    UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    self.myIV.image = image;
    //创建一个新的IV显示在红色View里面
    
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    iv.image = image;
    [self.v addSubview:iv];
//    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark NavigationDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    NSLog(@"将要显示 %d",navigationController.viewControllers.count);
    if (navigationController.viewControllers.count==2) {
        self.v = [[UIView alloc]initWithFrame:CGRectMake(0, 468, 320, 100)];
        self.v.backgroundColor = [UIColor redColor];
        [viewController.view addSubview:self.v];
    }
  
    
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSLog(@"已经显示");
}
@end
