//
//  TRMyLayout.m
//  Day9Collection
//
//  Created by tarena on 14-5-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMyLayout.h"

@implementation TRMyLayout

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        //设置每一个Cell的尺寸
        self.itemSize = CGSizeMake(200, 200);
        //设置滚动方向
        self.scrollDirection = UICollectionViewScrollDirectionVertical;

        //设置每行的间距
        self.minimumLineSpacing = 20;
        //设置collectionView内容据上下左右的距离
        self.sectionInset = UIEdgeInsetsMake(20, 20, 0, 20);
        
        
        
    }
    return self;
}







@end
