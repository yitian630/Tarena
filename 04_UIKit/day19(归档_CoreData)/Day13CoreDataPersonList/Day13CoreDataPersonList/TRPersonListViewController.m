//
//  TRPersonListViewController.m
//  Day13CoreDataPersonList
//
//  Created by tarena on 14-4-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPersonListViewController.h"
#import "TRAppDelegate.h"
#import "Person.h"
#import "TRPersonInfoViewController.h"
@interface TRPersonListViewController ()
@property (nonatomic, weak)TRAppDelegate *app;
@property (nonatomic, strong)NSArray *persons;
@end

@implementation TRPersonListViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.app = [UIApplication sharedApplication].delegate;
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //添加 添加按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPerson)];
    
    

    
    
}
-(void)addPerson{
    [self performSegueWithIdentifier:@"personinfovc" sender:Nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return self.persons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Person *p = self.persons[indexPath.row];
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",p.age];
    
    return cell;
}
-(void)viewWillAppear:(BOOL)animated{
    //查询数据库把所有Person显示出来
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Person"];
    self.persons = [self.app.managedObjectContext executeFetchRequest:request error:Nil];
    [self.tableView reloadData];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
   
        Person *p = self.persons[indexPath.row];
        
        [self.app.managedObjectContext deleteObject:p];
        [self.app saveContext];
        
        //查询数据库把所有Person显示出来   如果仅仅从数据库中删除 会崩掉 需要把数据源（self.persons）也修改一下
        NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Person"];
        self.persons = [self.app.managedObjectContext executeFetchRequest:request error:Nil];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Person *p = self.persons[indexPath.row];
    [self performSegueWithIdentifier:@"personinfovc" sender:p];
}
/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    TRPersonInfoViewController *vc = segue.destinationViewController;
    
    vc.editPerson = sender;
}


@end
