//
//  SpriteLayer.cpp
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#include "SpriteLayer.h"
#include "Enemy1.h"
#include "Enemy2.h"
#include "Hero.h"
#include "MapLayer.h"
#include "Defines.h"
bool SpriteLayer::init() {
    if (!CCLayer::init()) {
        return false;
    }
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Plist/enemy1.plist");
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Plist/enemy2.plist");
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Plist/Hero1.plist");


    //初始炸弹
    
    //初始化爆炸效果
    

    
    return true;
}

void SpriteLayer::initRole() {

    CCArray *objects = this->getMapLayer()->getObjectArr();
    for (int i = 0; i < objects->count(); i++) {
        CCDictionary *dic = (CCDictionary*)objects->objectAtIndex(i);
        //从字典中把 每个对象的属性取出来
        float x = dic->valueForKey("x")->floatValue() + 30;
        float y = dic->valueForKey("y")->floatValue() - 59;
        float speed = dic->valueForKey("speed")->floatValue();
        Role_Dir dir = (Role_Dir)dic->valueForKey("direction")->intValue();
        const CCString *name = dic->valueForKey("objectName");
        
        
        if (name->compare("hero") == 0) {
            m_hero = Hero::create();
            this->addChild(m_hero);
            m_hero->setPosition(ccp(x, y));
            m_hero->setROleDir(dir);
            m_hero->setSpeed(speed);
            m_hero->runRole_StandAnimation();
        }
        
        
        Role *enemy = NULL;
        if (name->compare("enemy1") == 0) {
            enemy = Enemy1::create();
        }else if(name->compare("enemy2") == 0) {
            enemy = Enemy2::create();
        }
        if (enemy) {
            enemy->setPosition(ccp(x, y));
            enemy->setSpeed(speed);
            enemy->runRole_MoveAnimation(dir);
            this->addChild(enemy);
        }
    }

    this->scheduleUpdate();
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
        if (this->isTileCollisionRole(m_hero)) {
            //英雄撞墙 退回一步
            m_hero->roleBackMove();
        } else {
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
}


void SpriteLayer::update(float time) {
    //英雄移动
    this->heroMove();
}

MapLayer* SpriteLayer::getMapLayer() {
    return (MapLayer*)this->getParent();
}

bool SpriteLayer::isTileCollisionRole(Role *role) {
    CCRect collisionArea = role->getCollisionArea();
    MapLayer *mapLayer = this->getMapLayer();
    //角色碰撞区域的左下角 是否 与地图碰撞
    if (mapLayer->isTileCollision(collisionArea.origin)) {
        return true;
    }
    //右下角
    if (mapLayer->isTileCollision(ccpAdd(collisionArea.origin, ccp(collisionArea.size.width, 0)))) {
        return true;
    }
    //左上
    if (mapLayer->isTileCollision(ccpAdd(collisionArea.origin, ccp(0, collisionArea.size.height)))) {
        return true;
    }
    //右上
    if (mapLayer->isTileCollision(ccpAdd(collisionArea.origin, ccp(collisionArea.size.width, collisionArea.size.height)))) {
        return true;
    }
    return false;
}

