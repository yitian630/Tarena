//
//  TRPersonInfoViewController.h
//  Day3TableView4Person
//
//  Created by tarena on 14-4-11.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRPerson.h"
@interface TRPersonInfoViewController : UIViewController
@property (nonatomic, strong)NSMutableArray *persons;
@property (nonatomic, strong)TRPerson *editPerson;
@end
