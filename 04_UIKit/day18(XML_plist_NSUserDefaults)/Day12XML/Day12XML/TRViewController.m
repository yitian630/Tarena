//
//  TRViewController.m
//  Day12XML
//
//  Created by tarena on 14-4-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRBook.h"
@interface TRViewController ()
@property (nonatomic, strong)TRBook *book;
@property (nonatomic, copy)NSString *currentString;
@property (nonatomic, strong)NSMutableArray *books;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.books = [NSMutableArray array];
    
	NSString *xmlPath = [[NSBundle mainBundle]pathForResource:@"books" ofType:@"xml"];
    
    NSData *data = [NSData dataWithContentsOfFile:xmlPath];
    
    NSXMLParser *parser = [[NSXMLParser alloc]initWithData:data];
    
    parser.delegate = self;
    //开始解析
    [parser parse];
    
    
    //解析完成 把数据输出出来
    for (TRBook *book in self.books) {
        NSLog(@"%@",book);
    }
    
}
//开始标签
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"book"]) {
        self.book = [[TRBook alloc]init];
        self.book.bookID = [[attributeDict objectForKey:@"id"] intValue];
    }
 
    NSLog(@"didStartElement %@",elementName);
}
//当发现标签之间的文本的时候
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    self.currentString = string;
}
//结束标签
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    NSLog(@"didEndElement %@",elementName);
    if ([elementName isEqualToString:@"name"]) {
        self.book.name = self.currentString;
    }else if ([elementName isEqualToString:@"author"]) {
        self.book.author = self.currentString;
    }else if ([elementName isEqualToString:@"price"]) {
        self.book.price = self.currentString.floatValue;
    }else if ([elementName isEqualToString:@"page"]) {
        self.book.page = self.currentString.intValue;
    }else if ([elementName isEqualToString:@"book"]){
        [self.books addObject:self.book];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
