//
//  Bomb.cpp
//  BombHero
//
//  Created by tarena on 14-6-18.
//
//

#include "Bomb.h"
Bomb* Bomb::createBomb(CCPoint position) {
    Bomb *bomb = new Bomb();
    if (bomb && bomb->initBomb(position)) {
        bomb->autorelease();
        return bomb;
    }
    CC_SAFE_DELETE(bomb);
    return NULL;
}
bool Bomb::initBomb(CCPoint position) {
    if (!CCNode::init()) return false;
    this->setPosition(position);
    
    m_showSprite = CCSprite::create();
    this->addChild(m_showSprite);
    
    CCAnimation *animation = CCAnimation::create();
    for (int i = 0; i < 4; i++) {
        CCSpriteFrame *frame = CCSpriteFrameCache::sharedSpriteFrameCache()->spriteFrameByName(CCString::createWithFormat("bomb%d.png", i + 1)->getCString());
        animation->addSpriteFrame(frame);
    }
    animation->setDelayPerUnit(0.08);
    animation->setLoops(8);
    CCAnimate *animate = CCAnimate::create(animation);
    CCCallFunc *callFunc = CCCallFunc::create(this, callfunc_selector(Bomb::bombExplosion));
    CCSequence *seq = CCSequence::create(animate, callFunc, NULL);
    m_showSprite->runAction(seq);
    
    
    
    return true;
}
//炸弹爆炸
void Bomb::bombExplosion() {
    CCLog("炸弹爆炸");
    this->removeFromParent();
}

