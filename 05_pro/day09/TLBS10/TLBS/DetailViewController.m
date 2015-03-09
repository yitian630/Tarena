//
//  DetailViewController.m
//  Day10WeiboDemo
//
//  Created by apple on 13-11-27.
//  Copyright (c) 2013年 tarena. All rights reserved.
//
#import "WeiboPaser.h"
#import "TRWeiboManager.h"
#import "DetailViewController.h"
#import "TRAppDelegate.h"
#import "Comment.h"
#import "CommentCell.h"
#import "UIImageView+WebCache.h"
#import "WeiboView.h"

 
@interface DetailViewController ()
@property (nonatomic,strong)NSMutableArray *comments;
@property (nonatomic, strong)UILabel *commentCountLabel;
@property (nonatomic, strong)NSMutableArray *requests;
@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"微博内容";
    self.requests = [NSMutableArray array];
    //添加原微博内容
    [self addHeaderView];
    //从服务器获取评论
    [self getComment];
    
}
-(void)getComment{
    [[TRWeiboManager shareManager]getCommentsByWeiboID:self.weibo.weiboId complation:^(id obj) {
        self.comments = obj;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];

}
-(void)addHeaderView{
     self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, self.weibo.getHeight+90)];
    
    UIImageView *userImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    NSURL *url = [NSURL URLWithString:self.weibo.user.head];
    [userImage setImageWithURL:url];

    [headerView addSubview:userImage];
    UILabel *nickLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 0,280,50)];
    nickLabel.text = self.weibo.user.nick;
    [headerView addSubview:nickLabel];
    
    
    UIButton *chat=[UIButton buttonWithType:UIButtonTypeCustom];
    chat.frame=CGRectMake(130, 35, 110, 20);
    [chat setTitle:@"和TA聊天" forState:UIControlStateNormal];
    [chat.titleLabel setHighlightedTextColor:[UIColor blackColor]];
    [chat.titleLabel setHighlighted:YES];
    [chat setImage:[UIImage imageNamed:@"talk.png"] forState:UIControlStateNormal];
    [chat addTarget:self action:@selector(talkAction) forControlEvents:UIControlEventTouchUpInside];
    
    [chat.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [chat.titleLabel setTextColor:[UIColor blackColor]];
    [headerView addSubview:chat];
    
    UIButton *messageBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    messageBtn.frame=CGRectMake(45, 35, 110, 20);
    [messageBtn setTitle:@"添加评论" forState:UIControlStateNormal];
    [messageBtn.titleLabel setHighlightedTextColor:[UIColor blackColor]];
    [messageBtn.titleLabel setHighlighted:YES];
    [messageBtn setImage:[UIImage imageNamed:@"message.png"] forState:UIControlStateNormal];
    [messageBtn addTarget:self action:@selector(messageAction) forControlEvents:UIControlEventTouchUpInside];
    
    [messageBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [messageBtn.titleLabel setTextColor:[UIColor blackColor]];
    [headerView addSubview:messageBtn];
 
    
    WeiboView *wv = [[WeiboView alloc]initWithFrame: CGRectMake(10,70,300,self.weibo.getHeight)];

    wv.weibo = self.weibo;
    
    [headerView addSubview:wv];
    
    self.commentCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, self.weibo.getHeight+80, 100, 20)];
    _commentCountLabel.backgroundColor = [UIColor clearColor];
    _commentCountLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    _commentCountLabel.textColor = [UIColor blueColor];

    [headerView addSubview:_commentCountLabel];

    self.tableView.tableHeaderView = headerView;
}
//添加评论
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *commentString = [alertView textFieldAtIndex:0].text;
    if (buttonIndex==1) {
        if (commentString&&![commentString isEqualToString:@""]) {
            //添加评论
            [[TRWeiboManager shareManager]addCommentsByInfo:commentString andWeiboID:self.weibo.weiboId complation:^(id obj) {
                dispatch_async(dispatch_get_main_queue(), ^{
                     [self getComment];
                });
            }];
            

        }
        
    }
}
-(void)messageAction{
    UIAlertView *messageAV = [[UIAlertView alloc]initWithTitle:@"请输入评论内容" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [messageAV setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [messageAV show];
}

-(void)talkAction{
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.comments.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Comment *comment = [self.comments objectAtIndex:indexPath.row];
    return comment.getCommentHight+40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Comment *comment = [self.comments objectAtIndex:indexPath.row];
    cell.comment = comment;
    return cell;
}

@end
