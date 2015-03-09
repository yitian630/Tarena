//
//  TRXMPPManager.h
//  Day7Xmpp
//
//  Created by tarena on 14-4-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMPPFramework.h"
@protocol XMPPManagerDelegate <NSObject>
@required
-(void)didReceiveMessage:(XMPPMessage*)message;

@end


@interface TRXMPPManager : NSObject<XMPPStreamDelegate>
@property (nonatomic, strong)XMPPStream *xmppStream;
@property (nonatomic, copy)NSString *openID;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, weak)id<XMPPManagerDelegate> delegate;


+(TRXMPPManager *)shareManager;
-(void)connectWithOpendid:(NSString *)openID andName:(NSString *)name;
-(void)sendMessage:(XMPPMessage *)message;

@end
