//
//  TRInputViewController.h
//  Demo1_Delegate
//
//  Created by tarena on 14-4-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TRInputViewController;

@protocol TRInputViewDelegate <NSObject>
- (void)inputViewController:(TRInputViewController *)inputVC inputContent:(NSString *)content;
@end

@interface TRInputViewController : UIViewController
@property (nonatomic, weak) id<TRInputViewDelegate> delegate;
@end
