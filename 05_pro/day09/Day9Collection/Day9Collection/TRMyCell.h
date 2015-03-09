//
//  TRMyCell.h
//  Day9Collection
//
//  Created by tarena on 14-5-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRMyCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myIV;
- (IBAction)clicked:(id)sender;

@end
