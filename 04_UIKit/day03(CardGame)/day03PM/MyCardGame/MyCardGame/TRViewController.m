//
//  TRViewController.m
//  MyCardGame
//
//  Created by tarena on 14-4-1.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) int score;
@end

@implementation TRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)touchCardButton:(UIButton *)sender
{
    if([sender titleForState:UIControlStateNormal].length > 0){
        UIImage *image = [UIImage imageNamed:@"cardback.png"];
        [sender setBackgroundImage:image forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        UIImage *image = [UIImage imageNamed:@"cardfront.png"];
        [sender setBackgroundImage:image forState:UIControlStateNormal];
        [sender setTitle:@"♣10" forState:UIControlStateNormal];
    }
    self.score++;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:%d", self.score];
}



@end
