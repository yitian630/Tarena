//
//  UserInfoViewController.m
//  TLBS-Project
//
//  Created by 123 on 13-12-20.
//  Copyright (c) 2013年 Wei WenRu. All rights reserved.
//

#import "UserInfoViewController.h"






@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}



-(void)viewWillAppear:(BOOL)animated{

   
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    self.headBg.layer.cornerRadius = 45;  //圆弧半径
    self.headBg.layer.borderWidth = .5;
    self.headBg.layer.borderColor = [UIColor grayColor].CGColor;
    self.headBg.layer.masksToBounds = YES;
    

}

-(void)viewDidAppear:(BOOL)animated{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[TRMyWeiboApi shareWeiboApi]loginWithDelegate:self andRootController:self];
    });
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jumpTo:(UIButton *)sender {
    switch (sender.tag) {
        case 0: //herTopic
        {
            
               }
            break;
            
        case 1: //sendMessage
        {
            
            
        }
            break;

    }
}
@end
