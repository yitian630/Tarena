//
//  Plane.cpp
//  Plane
//
//  Created by tarena on 14-6-11.
//
//

#include "Plane.h"
Plane* Plane::creatPlane(CCPoint position) {
    Plane *plane = new Plane();
    if (plane && plane->initPlane(position)) {
        plane->autorelease();
        return plane;
    }
    CC_SAFE_DELETE(plane);
    return NULL;
}
bool Plane::initPlane(CCPoint position) {
    if (!CCNode::init()) return false;
    //设置飞机位置
    this->setPosition(position);
    
    //飞机精灵
    m_showSprite = CCSprite::createWithSpriteFrameName("role1.png");
    this->addChild(m_showSprite);
    
    
    CCAnimation *animation = CCAnimation::create();
    for (int i = 0; i < 4; i++) {
//        role_fire%d.png
        CCSpriteFrame *frame = CCSpriteFrameCache::sharedSpriteFrameCache()->spriteFrameByName(CCString::createWithFormat("role_fire%d.png", i)->getCString());
        animation->addSpriteFrame(frame);
    }
    animation->setDelayPerUnit(0.01);
    animation->setLoops(-1);
    CCAnimate *animate = CCAnimate::create(animation);
    
    CCSprite *fire = CCSprite::create();
    fire->runAction(animate);
    this->addChild(fire);
    fire->setPositionY(-60);
    
    return true;
}








