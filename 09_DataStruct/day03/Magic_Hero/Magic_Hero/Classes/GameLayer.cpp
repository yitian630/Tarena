//
//  GameLayer.cpp
//  Magic_Hero
//
//  Created by tarena on 14-6-27.
//
//

#include "GameLayer.h"
#include "Defines.h"
#include "arrow.h"
CCScene* GameLayer::scene() {
    CCScene *scene = CCScene::create();
    GameLayer *layer = GameLayer::create();
    scene->addChild(layer);
    return scene;
}

bool GameLayer::init() {
    if(!CCLayer::init()) return false;
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("game/game2.plist");
    
    
    this->setTouchEnabled(true);
    this->setTouchMode(kCCTouchesOneByOne);
    
    
    CCSprite *bg = CCSprite::create("game/background1_dungeon.jpg");
    bg->setAnchorPoint(CCPointZero);
    this->addChild(bg);
    
    m_bow = Bow::createBow(3);
    this->addChild(m_bow);
    m_bow->setPosition(ccp(40, SCREEN.height * 0.5));
    
    this->schedule(schedule_selector(GameLayer::update), 0.3);

    
    return true;
}

void GameLayer::update(float time) {
    if (isShoot) {
        this->shoot();
    }
}

void GameLayer::shoot() {
    Arrow *arrow = Arrow::creatArrow(m_bow->getLevel(), m_bow->getPosition(),m_touchPoint);
    this->addChild(arrow);
}

bool GameLayer::ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent) {
    isShoot = true;
    m_touchPoint = pTouch->getLocation();
    CCPoint bowPoint = m_bow->convertToNodeSpace(pTouch->getLocation());
    //弧度值
    float angle = ccpAngleSigned(bowPoint, ccp(1, 0));
    m_bow->bowRotation(CC_RADIANS_TO_DEGREES(angle));
    return true;
}
void GameLayer::ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent) {
     m_touchPoint = pTouch->getLocation();
    CCPoint bowPoint = m_bow->convertToNodeSpace(pTouch->getLocation());
    //弧度值
    float angle = ccpAngleSigned(bowPoint, ccp(1, 0));
    m_bow->bowRotation(CC_RADIANS_TO_DEGREES(angle));
}
void GameLayer::ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent) {
    isShoot = false;
}



