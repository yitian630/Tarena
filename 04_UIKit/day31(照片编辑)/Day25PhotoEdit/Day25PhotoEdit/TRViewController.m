//
//  TRViewController.m
//  Day25PhotoEdit
//
//  Created by tarena on 14-5-15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic, strong)UINavigationController *nc;
@property (nonatomic)BOOL isEdit;
@end

@implementation TRViewController

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
- (IBAction)clicked:(id)sender {
    //在点击单张按钮的时候给isEdit赋值
    self.isEdit = YES;
    UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
    [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
    
}

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.nc = navigationController;
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
//从这个选中图片的地方 要判断当前是要干什么事儿
    if (self.isEdit) {
        
        UIViewController *editVC = [self.storyboard instantiateViewControllerWithIdentifier:@"editvc"];
        [self.nc pushViewController:editVC animated:YES];
    }else{
        
    }
   
}
 
@end
