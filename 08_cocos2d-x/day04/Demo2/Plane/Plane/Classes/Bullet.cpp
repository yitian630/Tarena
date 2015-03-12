//
//  Bullet.cpp
//  Plane
//
//  Created by tarena on 14-6-11.
//
//

#include "Bullet.h"
#include "Tools.h"
Bullet* Bullet::createBullet(CCPoint position) {
    Bullet *bullet = new Bullet();
    if (bullet && bullet->initBullet(position)) {
        bullet->autorelease();
        return bullet;
    }
    CC_SAFE_DELETE(bullet);
    return NULL;
}
bool Bullet::initBullet(CCPoint position) {
    if(!CCNode::init()) return false;
    
    this->setPosition(position);
    
    m_showSprite = CCSprite::createWithSpriteFrameName("1_20.png");
    this->addChild(m_showSprite);
    
    this->scheduleUpdate();
    return true;
}

void Bullet::removeBullet() {
    this->removeFromParent();
}

void Bullet::update(float time) {
    this->setPositionY(this->getPositionY() + speed);
    if (this->getPositionY() >= SCREEN.height + m_showSprite->getContentSize().height) {
        this->removeBullet();
    }
}
