//
//  SpriteLayer.h
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#ifndef __BombHero__SpriteLayer__
#define __BombHero__SpriteLayer__

#include <iostream>
#include "cocos2d.h"
#include "Rocker.h"
#include "Hero.h"
#include "MapLayer.h"
USING_NS_CC;

class SpriteLayer : public CCLayer, public  RockerDelegate{
public:
    ~SpriteLayer();
    CREATE_FUNC(SpriteLayer);
    bool init();
    void initRole();
private:
    Hero *m_hero;
    
    virtual void touchBegan_de(CCObject *rocker, RockerDirection dir);
    virtual void touchMove_de(CCObject *rocker, RockerDirection dir);
    virtual void touchEnd_de(CCObject *rocker, RockerDirection dir);
    
    void heroMove();
    void enemyMove();
    
    void update(float time);
    
    
    MapLayer* getMapLayer();
    
    bool isTileCollisionRole(Role *role);
    
    
    //存放敌人的数组
    CCArray *m_enemys;
};

#endif /* defined(__BombHero__SpriteLayer__) */






