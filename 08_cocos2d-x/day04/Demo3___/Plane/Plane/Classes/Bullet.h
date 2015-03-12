//
//  Bullet.h
//  Plane
//
//  Created by tarena on 14-6-11.
//
//

#ifndef __Plane__Bullet__
#define __Plane__Bullet__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

#define speed 30

class Bullet : public CCNode {
public:
    static Bullet* createBullet(CCPoint position);
    bool initBullet(CCPoint position);
    void removeBullet();
    //返回碰撞矩形
    CCRect getCollision_Area();
private:
    CCSprite *m_showSprite;
    void update(float time);
    
};

#endif /* defined(__Plane__Bullet__) */





