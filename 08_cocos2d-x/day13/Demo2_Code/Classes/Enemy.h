//
//  Enemy.h
//  XiaoQianRun
//
//  Created by tarena on 14-6-23.
//
//

#ifndef __XiaoQianRun__Enemy__
#define __XiaoQianRun__Enemy__

#include <iostream>
#include "cocos2d.h"
#include "MySprite.h"
USING_NS_CC;

typedef enum {
    LEFT,
    RIGHT,
}Enemy_Dir;


class Enemy : public MySprite {
public:
    bool initEnemy(float speed);
    void startMove();
    //获取 敌人的碰撞区域
    CCRect getCollisionArea();
protected:
    //创建敌人动画
    CCAnimate* createAnimate(const char* imageName, int col, int row);
private:
    Enemy_Dir m_currDir;
    float m_speed;
    void Move();
    void update(float time);
    
    //敌人最大移动距离
    float m_MaxDis;
    //敌人当前移动距离
    float m_CurrDis;
};


#endif /* defined(__XiaoQianRun__Enemy__) */






