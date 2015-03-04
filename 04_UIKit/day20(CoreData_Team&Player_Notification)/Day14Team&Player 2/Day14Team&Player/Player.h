//
//  Player.h
//  Day14Team&Player
//
//  Created by tarena on 14-4-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Team;

@interface Player : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Team *myTeam;

@end
