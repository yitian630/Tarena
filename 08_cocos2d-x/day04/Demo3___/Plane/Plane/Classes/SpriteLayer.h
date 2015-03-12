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
    //子弹数组
    CC_SYNTHESIZE(CCArray*, m_bullets, Bullets);
    
    //敌人数组
    CC_SYNTHESIZE(CCArray*, m_enemys, Enemys);
    //移除的子弹 的数组
    CC_SYNTHESIZE(CCArray*, m_removeBullets, RemoveBullets);
    //敌人数组
    CC_SYNTHESIZE(CCArray*, m_removeEnemys, RemoveEnemys);
private:
    Plane *m_plane;
    //记录上次的位置
    CCPoint tempPosition;
    
    CloudPool *m_cloudPool;
    void addCloud();
    
    //发射子弹
    void shootBullet();
    //添加敌人
    void addEnemy();
    
    //子弹与敌人  的 碰撞处理
    void bulletCollisionEnemy();
    
    virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);
    
    void update(float time);
    
    void removeObject();
};

#endif /* defined(__Plane__SpriteLayer__) */






