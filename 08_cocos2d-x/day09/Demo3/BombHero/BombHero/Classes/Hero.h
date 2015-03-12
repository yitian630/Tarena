//
//  Hero.h
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#ifndef __BombHero__Hero__
#define __BombHero__Hero__

#include <iostream>
#include "cocos2d.h"
#include "Role.h"
USING_NS_CC;

class Hero : public Role {
public:
    CREATE_FUNC(Hero);
    bool init();
    
    //创建一个动画对象
    CCAnimate* createAnimate(const char *spriteFramName, int frameCount, int Loops = -1);
};

#endif /* defined(__BombHero__Hero__) */






