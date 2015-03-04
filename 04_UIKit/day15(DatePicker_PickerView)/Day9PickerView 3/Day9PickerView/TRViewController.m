//
//  TRViewController.m
//  Day9PickerView
//
//  Created by tarena on 14-4-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRUtlis.h"
@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *myPV;
- (IBAction)beginGame:(id)sender;
@property (nonatomic)int moveCount;
@property (weak, nonatomic) IBOutlet UILabel *totalMoney;
@property (weak, nonatomic) IBOutlet UILabel *currentMoney;
- (IBAction)valueChangeAction:(UIStepper *)sender;

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (int i=0; i<5; i++) {
        [self.myPV selectRow:500 inComponent:i animated:YES];
    }
   

}
-(void)countDownMoveCount:(NSTimer *)timer{
    
    self.moveCount++;
    if (self.moveCount==5) {
        [timer invalidate];
    }
}

-(void)movePV:(NSTimer *)timer{
    for (int i=self.moveCount; i<5; i++) {
//      0 1 2 3 4
//
        [self.myPV selectRow:arc4random()%990+10 inComponent:i animated:YES];
    }
    //当所有列都停止的时候让timer停止 此时也是游戏结束的时候 算出 当前有多少个相同的图片
    if (self.moveCount==5) {
        [timer invalidate];
        //输出当前选中的行数
        NSMutableArray *results = [NSMutableArray array];
        for (int i=0;i<5; i++) {
            int seletedRow =   [self.myPV selectedRowInComponent:i];
            NSLog(@"第%d列选中%d行",i,seletedRow%5);
            
            [results addObject:[NSNumber numberWithInt:seletedRow%4]];
            

        }
        
        //在此位置得到了所有选中的行数 根据这个选中的数 判断游戏得分为多少
        int maxCount = [TRUtlis getMaxCount:results];
        switch (maxCount) {
            case 1:
                 self.statusLabel.text = [NSString stringWithFormat:@"您人品不行啊！输掉%@",self.currentMoney.text];
                //总钱数 减去当前押注数量
                self.totalMoney.text  = [NSString stringWithFormat:@"%d",self.totalMoney.text.intValue - self.currentMoney.text.intValue];
                break;
                
            case 2:
                self.statusLabel.text = @"再接再厉！";
                //总钱数 减去当前押注数量
              
                break;
            case 3:
                self.statusLabel.text = [NSString stringWithFormat:@"恭喜您！赢了%d",self.currentMoney.text.intValue*3];
                //总钱数 减去当前押注数量
                self.totalMoney.text  = [NSString stringWithFormat:@"%d",self.totalMoney.text.intValue + self.currentMoney.text.intValue*3];
                break;
            case 4:
                  self.statusLabel.text = [NSString stringWithFormat:@"恭喜您！赢了%d",self.currentMoney.text.intValue*6];
                //总钱数 减去当前押注数量
                self.totalMoney.text  = [NSString stringWithFormat:@"%d",self.totalMoney.text.intValue + self.currentMoney.text.intValue*6];
                break;
            case 5:
                self.statusLabel.text =   self.statusLabel.text = [NSString stringWithFormat:@"恭喜您！赢了%d",self.currentMoney.text.intValue*10];
                //总钱数 减去当前押注数量
                self.totalMoney.text  = [NSString stringWithFormat:@"%d",self.totalMoney.text.intValue + self.currentMoney.text.intValue*10];
                break;
        }
        
    }
    
}

#pragma mark PickerViewDelegate
//控制有多少个分区
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 5;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
  
    return 1000;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
//    UILabel *label = (UILabel *)view;
//    if (!label) {
//       label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
//    }
//    label.text = [NSString stringWithFormat:@"%d-%d",component,row];
//    ***************显示图片
    UIImageView *iv = (UIImageView *)view;
    if (!iv) {
        iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    }
    NSString *imageName = [NSString stringWithFormat:@"%d.jpg",row%4];
    iv.image = [UIImage imageNamed:imageName];
    
    return iv;
}
- (IBAction)beginGame:(id)sender {
   self.moveCount = 0;
    [NSTimer scheduledTimerWithTimeInterval:.3 target:self selector:@selector(movePV:) userInfo:nil repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownMoveCount:) userInfo:nil repeats:YES];

}
- (IBAction)valueChangeAction:(UIStepper *)sender {
    
    self.currentMoney.text = [NSString stringWithFormat:@"%d",(int)sender.value];
}
@end
