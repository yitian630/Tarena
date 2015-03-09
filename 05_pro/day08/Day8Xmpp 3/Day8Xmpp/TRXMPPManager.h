//
//  TRXMPPManager.h
//  Day8Xmpp
//
//  Created by tarena on 14-5-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMPPFramework.h"

@protocol XMPPManagerDelegate <NSObject>

@required
-(void)didReceiveMessage:(XMPPMessage*)message;

@end

@interface TRXMPPManager : NSObject

+(TRXMPPManager *)shareManager;
@property (nonatomic, strong)XMPPStream *xmppStream;
-(void)sendMessage:(NSString *)messageStr toName:(NSString *)name;
@property (nonatomic, weak)id<XMPPManagerDelegate> delegate;
@end

