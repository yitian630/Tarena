//
//  TRViewController.m
//  Day3Lrc2
//
//  Created by tarena on 14-4-11.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *lrcs;
@property (nonatomic)int myRow;
@end

@implementation TRViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
       self.lrcs = [NSMutableArray arrayWithObjects:@"起来",@"不愿做奴隶的人们",@"把我们的血肉",@"著称我们新的长城",@"中华民族到了",@"最危险的时候",@"每个人被迫着发出最后的吼声",@"起来",@"起来",@"起来",@"起来",@"不愿做奴隶的人们",@"把我们的血肉",@"著称我们新的长城",@"中华民族到了",@"最危险的时候",@"每个人被迫着发出最后的吼声",@"起来",@"起来",@"起来",@"每个人被迫着发出最后的吼声",@"起来",@"起来",@"起来",@"起来",@"不愿做奴隶的人们",@"把我们的血肉",@"著称我们新的长城",@"中华民族到了",@"最危险的时候",@"每个人被迫着发出最后的吼声",@"起来",@"起来",@"起来", nil];
    
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(moveLrc) userInfo:Nil repeats:YES];
}
-(void)moveLrc{
//    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.myRow++ inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:self.myRow++ inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    //如果滚动到了最后一行 那就从头再来
    if (self.myRow==self.lrcs.count) {
        self.myRow=0;
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.lrcs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = self.lrcs[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.highlightedTextColor = [UIColor redColor];
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    cell.textLabel.textColor = [UIColor greenColor];
    cell.backgroundColor = [UIColor blackColor];
    //创建一个填充cell的View
    cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.bounds];
    
    
    cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 20;
}
@end
