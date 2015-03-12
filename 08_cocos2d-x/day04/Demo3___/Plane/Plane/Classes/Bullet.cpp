//
//  Bullet.cpp
//  Plane
//
//  Created by tarena on 14-6-11.
//
//

#include "Bullet.h"
#include "SpriteLayer.h"
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
    this->unscheduleUpdate();
    CCArray *removeBullets =  ((Spritelayer*)this->getParent())->getRemoveBullets();
    //把要移除子弹  添加到 释放数组中
    removeBullets->addObject(this);
    this->removeFromParent();
}

void Bullet::update(float time) {
    this->setPositionY(this->getPositionY() + speed);
    if (this->getPositionY() >= SCREEN.height + m_showSprite->getContentSize().height) {
        this->removeBullet();
    }
}

CCRect Bullet::getCollision_Area() {
    CCRect rect = m_showSprite->boundingBox();
    //把坐标转换到 精灵层坐标系下
    float x = rect.origin.x + this->getPositionX();
    float y = rect.origin.y + this->getPositionY();
    float w = rect.size.width;
    float h = rect.size.height;
    return CCRectMake(x, y, w, h);

}



