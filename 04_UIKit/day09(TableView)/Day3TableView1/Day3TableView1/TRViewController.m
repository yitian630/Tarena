//
//  TRViewController.m
//  Day3TableView1
//
//  Created by tarena on 14-4-11.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray *names;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.names = @[@"张三",@"李四",@"王五"];
    //让tableView的delegate和datasource 指向controller
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
  
}
//必须实现的方法1  告诉tableview有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.names.count;
}


//必须实现的方法2
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    //去内存当中找 有没有离开页面的并且标示为“Cell”的Cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        //如果没有获取到重用Cell 那就创建一个
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.names[indexPath.row];
    
    return cell;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
