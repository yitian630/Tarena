//
//  TRViewController.m
//  Day12Face
//
//  Created by tarena on 14-4-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mySV;
@property (weak, nonatomic) IBOutlet UITextField *myTF;
@property (nonatomic, strong)NSArray *faces;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.faces = [NSArray arrayWithContentsOfFile:@"/Users/tarena/Desktop/Day12Face/Day12Face/face/emoticons.plist"];
    
    for (int i=0; i<self.faces.count; i++) {
        NSDictionary *faceDic = self.faces[i];
        NSString *imageName = [faceDic objectForKey:@"png"];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i%8*40, i/8*40, 40, 40)];
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.mySV addSubview:btn];
        int row = self.faces.count%8==0?self.faces.count/8 :self.faces.count/8+1;
        [self.mySV setContentSize:CGSizeMake(0, row*40)];
    }
}
-(void)clicked:(UIButton *)btn{
    NSDictionary *faceDic = self.faces[btn.tag];
    NSString *text = [faceDic objectForKey:@"chs"];
    
    self.myTF.text = [self.myTF.text stringByAppendingString:text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
