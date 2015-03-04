//
//  TRViewController.m
//  Day21HitMouseOnline
//
//  Created by tarena on 14-5-10.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRMouse.h"
@interface TRViewController ()
@property (nonatomic, strong)AsyncSocket *serverSocket;
@property (nonatomic, strong)AsyncSocket *myNewSocket;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.serverSocket = [[AsyncSocket alloc]initWithDelegate:self];
    [self.serverSocket acceptOnPort:8000 error:Nil];
    
}

-(void)onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket{
    self.myNewSocket = newSocket;
   
    [self.myNewSocket readDataWithTimeout:-1 tag:0];
}



-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    //把接收到的data 转成字符串 看是否是 you win！如果是 则表示赢了
    
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    if (str&& [str isEqualToString:@"You win!"]) {
        
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"提示" message:@"恭喜你获胜了！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:Nil, nil];
        [av show];

        return;
        
    }
    
    
    
    //反归档把接收到的data转成point
    NSKeyedUnarchiver *unArch = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    NSValue *v = [unArch decodeObjectForKey:@"v"];
    CGPoint p = [v CGPointValue];
    
    
    [self addMouseAtPoint:p];

    //继续读取数据
    [self.myNewSocket readDataWithTimeout:-1 tag:0];
}

-(void)addMouseAtPoint:(CGPoint)point{
    TRMouse *m = [[TRMouse alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    m.delegate = self;
    m.center = point;
    [self.view addSubview:m];
}

-(void)gameover{
    
    NSString *str = @"You win!";
    [self.myNewSocket writeData:[str dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
    
    
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"提示" message:@"你输了！！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:Nil, nil];
    [av show];

    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self.view];
    NSValue *v = [NSValue valueWithCGPoint:p];
    NSMutableData *md = [NSMutableData data];
    NSKeyedArchiver *arch = [[NSKeyedArchiver alloc]initForWritingWithMutableData:md];
    [arch encodeObject:v forKey:@"v"];
    [arch finishEncoding];
    
    [self.myNewSocket writeData:md withTimeout:-1 tag:0];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
