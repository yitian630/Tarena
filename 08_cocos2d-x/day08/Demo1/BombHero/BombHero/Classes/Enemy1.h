//
//  Enemy1.h
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#ifndef __BombHero__Enemy1__
#define __BombHero__Enemy1__

#include <iostream>
#include "cocos2d.h"
#include "Role.h"
USING_NS_CC;

class Enemy1 : public Role {
public:
    CREATE_FUNC(Enemy1);
    virtual bool init();
};


#endif /* defined(__BombHero__Enemy1__) */




