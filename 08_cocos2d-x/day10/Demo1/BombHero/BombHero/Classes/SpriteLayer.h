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
#include "Explosion.h"
USING_NS_CC;

class SpriteLayer : public CCLayer, public  RockerDelegate{
public:
    ~SpriteLayer();
    CREATE_FUNC(SpriteLayer);
    bool init();
    void initRole();
    
    void shootBomb(CCObject *sender);
    void bombExplosion(CCPoint position);
    
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
    //检测 爆炸是否炸到了角色
    bool explosionCollisionRole(Explosion *explosion, Role *role);
    //检测 敌人是否碰到英雄
    bool enemyCollisionHero();
    
    //遍历 炸弹 都炸到了谁
    void detectionExplosion();
    
    //清空不需要的对象
    void removeObject();
    
    
    //存放敌人的数组
    CCArray *m_enemys;
    //爆炸对象 数组
    CCArray *m_explosions;
    CC_SYNTHESIZE_READONLY(CCArray*, m_removeExplosions, RemoveExplosions);
    
    void GameWin();
    void GameLose();
    void stopRocker();

};

#endif /* defined(__BombHero__SpriteLayer__) */






