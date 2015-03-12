//
//  Explosion.cpp
//  BombHero
//
//  Created by tarena on 14-6-18.
//
//

#include "Explosion.h"
#include "SpriteLayer.h"
Explosion* Explosion::createExplosion(CCPoint position) {
    Explosion *explosion = new Explosion();
    if (explosion && explosion->initExplosion(position)) {
        explosion->autorelease();
        return explosion;
    }
    CC_SAFE_DELETE(explosion);
    return NULL;
}
bool Explosion::initExplosion(CCPoint position) {
    if(!CCNode::init()) return false;
    this->setPosition(position);
    
    m_showSprite = CCSprite::create();
    this->addChild(m_showSprite);
    
    CCAnimation *animation = CCAnimation::create();
    for (int i = 0; i < 4; i++) {
        CCSpriteFrame *frame = CCSpriteFrameCache::sharedSpriteFrameCache()->spriteFrameByName(CCString::createWithFormat("Explosion%d.png", i + 1)->getCString());
        animation->addSpriteFrame(frame);
    }
    animation->setDelayPerUnit(0.1);
    CCAnimate *animate = CCAnimate::create(animation);
    CCCallFunc *callFunc = CCCallFunc::create(this, callfunc_selector(Explosion::Exploion_End));
    CCSequence *seq = CCSequence::create(animate, callFunc, NULL);
    m_showSprite->runAction(seq);

    return true;
}

//爆炸完成
void Explosion::Exploion_End(){
    SpriteLayer *spriteLayer = (SpriteLayer*)this->getParent();
    spriteLayer->getRemoveExplosions()->addObject(this);
    this->removeFromParent();
}
