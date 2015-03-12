//
//  GameLayer.h
//  Magic_Hero
//
//  Created by tarena on 14-6-27.
//
//

#ifndef __Magic_Hero__GameLayer__
#define __Magic_Hero__GameLayer__

#include <iostream>
#include "cocos2d.h"
#include "Bow.h"
USING_NS_CC;

class GameLayer : public CCLayer{
public:
    static CCScene* scene();
    CREATE_FUNC(GameLayer);
    bool init();
    
    Bow *m_bow;
    
    void shoot();
    
    
    virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);
    
    CCPoint m_touchPoint;
    
    void update(float time);
    bool isShoot;
};

#endif /* defined(__Magic_Hero__GameLayer__) */






