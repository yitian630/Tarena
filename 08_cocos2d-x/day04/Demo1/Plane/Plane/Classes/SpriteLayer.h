//
//  SpriteLayer.h
//  Plane
//
//  Created by tarena on 14-6-10.
//
//

#ifndef __Plane__SpriteLayer__
#define __Plane__SpriteLayer__

#include <iostream>
#include "cocos2d.h"
#include "CloudPool.h"
#include "Plane.h"
USING_NS_CC;

class Spritelayer : public CCLayer {
public:
    ~Spritelayer();
    CREATE_FUNC(Spritelayer);
    virtual bool init();
private:
    Plane *m_plane;
    //记录上次的位置
    CCPoint tempPosition;
    
    CloudPool *m_cloudPool;
    void addCloud();
    
    
    
    virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);
};

#endif /* defined(__Plane__SpriteLayer__) */






