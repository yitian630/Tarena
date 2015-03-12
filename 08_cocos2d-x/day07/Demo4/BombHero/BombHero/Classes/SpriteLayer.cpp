//
//  SpriteLayer.cpp
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#include "SpriteLayer.h"
#include "Enemy1.h"
#include "Hero.h"
#include "MapLayer.h"
#include "Defines.h"
bool SpriteLayer::init() {
    if (!CCLayer::init()) {
        return false;
    }
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Plist/enemy1.plist");
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Plist/Hero1.plist");
    
    //初始化角色
    //初始化敌人
    m_hero = Hero::create();
    m_hero->setPosition(ccp(200, 1100));
    m_hero->setRoleState(Role_Stand);
    m_hero->setROleDir(Role_Down);
    m_hero->runRole_StandAnimation();
    m_hero->setSpeed(3);
    this->addChild(m_hero);
    
    //初始化敌人
    Enemy1 *enemy1 = Enemy1::create();
    enemy1->setPosition(ccp(400, 320));
    enemy1->setRoleState(Role_Stand);
    enemy1->runRole_MoveAnimation(Role_Right);
    this->addChild(enemy1);
    //初始炸弹
    
    //初始化爆炸效果
    
    this->scheduleUpdate();
    
    return true;
}

 void SpriteLayer::touchBegan_de(CCObject *rocker, RockerDirection dir) {
     m_hero->runRole_MoveAnimation((Role_Dir)dir);
     
     }
 void SpriteLayer::touchMove_de(CCObject *rocker, RockerDirection dir) {
     m_hero->runRole_MoveAnimation((Role_Dir)dir);
}
 void SpriteLayer::touchEnd_de(CCObject *rocker, RockerDirection dir) {
     //运行角色站立的动画
     m_hero->runRole_StandAnimation();
}

void SpriteLayer::heroMove() {
    if (m_hero->getRoleState() == Role_Move) {
        CCPoint movePoint = m_hero->roleMove();
        bool isMove = false;
        switch ((int)m_hero->getROleDir()) {
            case Role_UP:
            case Role_Down:
                if (m_hero->getPositionY() <= this->getMapLayer()->getMapSize().height - SCREEN.height * 0.5 && m_hero->getPositionY() > SCREEN.height * 0.5) {
                    isMove = true;
                }
                break;
            case Role_Left:
            case Role_Right:
                if (m_hero->getPositionX() <= this->getMapLayer()->getMapSize().width - SCREEN.width * 0.5 && m_hero->getPositionX() > SCREEN.width * 0.5) {
                    isMove = true;
                }
                break;


        }
        if (isMove) {
            this->getMapLayer()->moveMap(ccp(-movePoint.x, -movePoint.y));
        }
      
    }
}


void SpriteLayer::update(float time) {
    //英雄移动
    this->heroMove();
}

MapLayer* SpriteLayer::getMapLayer() {
    return (MapLayer*)this->getParent();
}



