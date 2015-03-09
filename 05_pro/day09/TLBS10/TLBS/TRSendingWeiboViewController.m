//
//  TRSendingWeiboViewController.m
//  TLBS-Project
//
//  Created by LIU XU on 13-12-22.
//  Copyright (c) 2013年 Wei WenRu. All rights reserved.
//
#import "TRMapManager.h"
#import "TRSendingWeiboViewController.h"
#import "TRAppDelegate.h"
#import "SelectLocationViewController.h"
@interface TRSendingWeiboViewController ()
@property (nonatomic, strong)UIImage *image;
@property (nonatomic, weak)TRAppDelegate *app;
@property (nonatomic, strong)UIAlertView *waitAV;
@end

@implementation TRSendingWeiboViewController

- (IBAction)SendWeibo:(id)sender {


        NSMutableDictionary *params = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"json",@"format",
                                       self.sendInfoTV.text, @"content",
                                       
                         [NSString stringWithFormat:@"%f",self.seletedCoord.longitude],@"longitude",[NSString stringWithFormat:@"%f",self.seletedCoord.latitude]
                                       ,@"latitude",self.image, @"pic",
                                       nil];
        [self.app.weiboApi requestWithParams:params apiName:@"t/add_pic" httpMethod:@"POST" delegate:self];
    
    self.waitAV = [[UIAlertView alloc]initWithTitle:@"正在发送请稍后。。。" message:Nil delegate:Nil cancelButtonTitle:Nil otherButtonTitles:Nil, nil];
    [self.waitAV show];
 
    
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)addImage:(id)sender {
    UIActionSheet *as = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"打开照相机" otherButtonTitles:@"从手机相册获取", nil];
    [as showInView:self.view];
    
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    
    self.image = [info objectForKey:@"UIImagePickerControllerEditedImage"];

    self.iv.image=self.image;
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)viewDidLoad{
    self.app = [UIApplication sharedApplication].delegate;
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bg.png"] forBarMetrics:UIBarMetricsDefault];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%d",buttonIndex);
    
    switch (buttonIndex) {
        case 0:{
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
                [ipc setSourceType:UIImagePickerControllerSourceTypeCamera];
                ipc.delegate = self;
                ipc.allowsEditing = YES;
                [self presentViewController:ipc animated:YES completion:nil];
            }else{
                NSLog(@"这设备没相机");
            }
            
        }
            
            break;
            
        case 1:{
            UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
            [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            ipc.delegate = self;
            ipc.allowsEditing = YES;
            [self presentViewController:ipc animated:YES completion:nil];
        }
            break;
    }
}
- (IBAction)mapAction:(id)sender {

}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text hasPrefix:@"说说您身边的"]) {
        textView.text = @"";
    }
    [textView setTextColor:[UIColor blackColor]];
}

-(void)viewDidAppear:(BOOL)animated{
    if (self.seletedCoord.latitude==0) {
        //创建一个默认的位置
        CLLocationCoordinate2D location;
        location.latitude =39.90960456049752;
        location.longitude =116.3972282409668;
        self.seletedCoord = location;
    }
}

- (void)didReceiveRawData:(NSData *)data reqNo:(int)reqno
{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
    
     NSLog(@"发送结果：%@",dic);
    
    NSDictionary *dataDic = [dic objectForKey:@"data"];
    NSString *weiboID = [dataDic objectForKey:@"id"];
    //给百度地图服务器发请求创建位置信息
  
    
    [[TRMapManager shareManager] createPoiWithLocation:self.seletedCoord andWeiboID:weiboID];
    
    
    [self.waitAV dismissWithClickedButtonIndex:0 animated:YES];
    self.waitAV = [[UIAlertView alloc]initWithTitle:@"发送完成！" message:Nil delegate:self cancelButtonTitle:Nil otherButtonTitles:@"确定", nil];
    [self.waitAV show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
      [self dismissViewControllerAnimated:YES completion:Nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SelectLocationViewController *vc = segue.destinationViewController;
    vc.deletage = self;
}

@end
