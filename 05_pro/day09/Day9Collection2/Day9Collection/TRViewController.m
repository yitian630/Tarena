//
//  TRViewController.m
//  Day9Collection
//
//  Created by tarena on 14-5-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRMyCell.h"
@interface TRViewController ()

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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 120;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    TRMyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.tag = indexPath.row;
//    UILabel *l = [[UILabel alloc]initWithFrame:cell.bounds];
//    
//    l.text = [NSString stringWithFormat:@"%d",indexPath.row];
//    [cell.contentView addSubview:l];
//    l.backgroundColor = [UIColor yellowColor];
    
    
    
    return cell;
    
}
@end
