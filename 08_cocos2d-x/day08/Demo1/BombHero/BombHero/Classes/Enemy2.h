//
//  Enemy2.h
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#ifndef __BombHero__Enemy2__
#define __BombHero__Enemy2__

#include <iostream>
#include "cocos2d.h"
#include "Role.h"
USING_NS_CC;

class Enemy2 : public Role {
public:
    CREATE_FUNC(Enemy2);
    virtual bool init();
};


#endif /* defined(__BombHero__Enemy2__) */




