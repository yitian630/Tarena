//
//  Bomb.h
//  BombHero
//
//  Created by tarena on 14-6-18.
//
//

#ifndef __BombHero__Bomb__
#define __BombHero__Bomb__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class Bomb : public CCNode {
public:
    static Bomb* createBomb(CCPoint position);
    bool initBomb(CCPoint position);
private:
    CCSprite *m_showSprite;
    //炸弹爆炸
    void bombExplosion();
};

#endif /* defined(__BombHero__Bomb__) */





