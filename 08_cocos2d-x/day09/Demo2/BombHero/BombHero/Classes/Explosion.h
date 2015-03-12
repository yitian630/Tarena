//
//  Explosion.h
//  BombHero
//
//  Created by tarena on 14-6-18.
//
//

#ifndef __BombHero__Explosion__
#define __BombHero__Explosion__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class Explosion : public CCNode {
public:
    static Explosion* createExplosion(CCPoint position);
    bool initExplosion(CCPoint position);
private:
    CCSprite *m_showSprite;
    //爆炸完成
    void Exploion_End();
};


#endif /* defined(__BombHero__Explosion__) */
