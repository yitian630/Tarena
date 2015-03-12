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
bool SpriteLayer::init() {
    if (!CCLayer::init()) {
        return false;
    }
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Plist/enemy1.plist");
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Plist/Hero1.plist");
    
    //初始化角色
    //初始化敌人
    Hero *hero = Hero::create();
    hero->setPosition(ccp(200, 320));
    hero->setRoleState(Role_Stand);
    hero->setROleDir(Role_UP);
    hero->runRole_MoveAnimation(Role_Left);
    this->addChild(hero);
    
    //初始化敌人
    Enemy1 *enemy1 = Enemy1::create();
    enemy1->setPosition(ccp(400, 320));
    enemy1->setRoleState(Role_Stand);
    enemy1->runRole_MoveAnimation(Role_Right);
    this->addChild(enemy1);
    //初始炸弹
    
    //初始化爆炸效果
    
    return true;
}




