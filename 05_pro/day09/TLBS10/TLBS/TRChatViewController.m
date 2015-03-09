//
//  TRChatViewController.m
//  TLBS
//
//  Created by tarena on 14-4-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRChatViewController.h"
#import "RecordButton.h"
#import "TRMessageCell.h"

@interface TRChatViewController ()
@property (weak, nonatomic) IBOutlet RecordButton *recordBtn;
@property (weak, nonatomic) IBOutlet UITextField *sendInfoTF;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *messages;

- (IBAction)sendAction:(id)sender;

@end

@implementation TRChatViewController
-(void)viewDidAppear:(BOOL)animated{
//    [self.sendInfoTF becomeFirstResponder];
}
-(void)didReceiveMessage:(XMPPMessage *)message{
    [self.messages addObject:message];
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.messages.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.sendToUserInfo.nick;
	self.messages = [NSMutableArray array];
    [TRXMPPManager shareManager].delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    //让按钮能够回掉回来
    self.recordBtn.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)recordButtonAction:(UIButton *)sender {
    
    if (self.recordBtn.hidden) {
        
        [self.sendInfoTF resignFirstResponder];
        [sender setImage:[UIImage imageNamed:@"message.png"] forState:UIControlStateNormal];
        self.recordBtn.hidden = NO;
    }else{
        [self.sendInfoTF becomeFirstResponder];
        self.recordBtn.hidden = YES;
        [sender setImage:[UIImage imageNamed:@"mic.png"] forState:UIControlStateNormal];
    }

}

-(void)sendMessageString:(NSString *)messageString andType:(NSString *)type{
    NSString *jidString = [NSString stringWithFormat:@"%@@tareng3gxmpp.com",self.sendToUserInfo.name];
//    text  image  audio
    XMPPMessage *message = [XMPPMessage messageWithType:type to:[XMPPJID jidWithString:jidString]];
    
    [message addBody:messageString];
    
    [[TRXMPPManager shareManager]sendMessage:message];
    [self.messages addObject:message];
    [self.tableView reloadData];
    
    //保证tableview永远现实当前发送的数据
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.messages.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}
- (IBAction)sendAction:(id)sender {
    [self sendMessageString:self.sendInfoTF.text andType:@"message"];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    return self.messages.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    XMPPMessage *message = self.messages[indexPath.row];
    if ([message.type isEqualToString:@"image"]||[message.type isEqualToString:@"audio"]) {
        return 50;
    }
    //下面是算cell高度的代码
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
    CGSize size = [message.body boundingRectWithSize:CGSizeMake(200, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    
    return  size.height+40;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TRMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    XMPPMessage * message = self.messages[indexPath.row];
    cell.message = message;
    cell.delegate = self;
    return cell;
}




#pragma mark - keyboard reference
-(void)WillChangeFrame:(NSNotification *)notif{
    
    NSDictionary *info = [notif userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    NSLog(@"%f",value.CGRectValue.origin.y);
    if (value.CGRectValue.origin.y>400) {
        [UIView animateWithDuration:.2 animations:^{
            self.tabBarView.center = CGPointMake(self.tabBarView.center.x,self.view.bounds.size.height  - self.tabBarView.bounds.size.height / 2);
            self.tableView.frame = CGRectMake(0, 0, 320, self.view.bounds.size.height  - self.tabBarView.bounds.size.height);
        }];
        
        
    }else{
        
        [UIView animateWithDuration:.2 animations:^{
            self.tabBarView.center = CGPointMake(self.tabBarView.center.x,self.view.bounds.size.height -  keyboardSize.height - self.tabBarView.bounds.size.height / 2);
            self.tableView.frame = CGRectMake(0, 0, 320, self.view.bounds.size.height  - self.tabBarView.bounds.size.height-keyboardSize.height);
            
        }];
        
        
    }
    
        
    
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 发送图片
- (IBAction)clicked:(id)sender {
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
    [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    NSLog(@"%@",info);
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    NSURL *imageUrl = [info objectForKey:@"UIImagePickerControllerReferenceURL"];
    NSData *imageData = nil;
    if ([[imageUrl absoluteString] hasSuffix:@"PNG"]) {
        imageData = UIImagePNGRepresentation(image);
    }else{//JPG 后面参数是压缩质量0-1 1代表质量最高
        imageData = UIImageJPEGRepresentation(image, 1.0);
    }
    
    NSString *base64String = [imageData base64EncodedStringWithOptions:0];
    
    NSLog(@"%@",base64String);
    [self sendMessageString:base64String andType:@"image"];

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
