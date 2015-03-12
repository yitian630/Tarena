//
//  Enemy.h
//  Plane
//
//  Created by tarena on 14-6-11.
//
//

#ifndef __Plane__Enemy__
#define __Plane__Enemy__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

typedef enum {
    BUG,
    DUCK,
    PIG
}EnemyType;


class Enemy : public CCNode {
public:
    static Enemy* createEnemy(CCPoint position, EnemyType type, float _speed);
    bool initEnemy(CCPoint position, EnemyType type, float _speed);
    void removeEnemy();
    //返回碰撞矩形
    CCRect getCollision_Area();
private:
    float m_speed;
    CCSprite *m_showSprite;
    CCAnimate* createAnimate(EnemyType type);
    void update(float time);
};

#endif /* defined(__Plane__Enemy__) */





