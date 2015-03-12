//
//  Enemy.cpp
//  XiaoQianRun
//
//  Created by tarena on 14-6-23.
//
//

#include "Enemy.h"
#include "SpriteLayer.h"
bool Enemy::initEnemy(float speed) {
    if (!MySprite::init()) return false;
    m_speed = speed;
    
    this->bindSprite(CCSprite::create());
    
    m_currDir = RIGHT;
    if (m_currDir == RIGHT) {
         this->setRotationY(180);
    }
    
    
    m_MaxDis = 200;
    m_CurrDis = 0;
    
    
    return true;
}

void Enemy::startMove() {
    this->scheduleUpdate();
}

//创建敌人动画
CCAnimate* Enemy::createAnimate(const char* imageName, int col, int row) {
    CCTexture2D *texture = CCTextureCache::sharedTextureCache()->addImage(imageName);
    
    float w = texture->getContentSize().width / col;
    float h = texture->getContentSize().height / row;
    
    CCAnimation *animation = CCAnimation::create();
    for (int i = 0; i < col * row; i++) {
        CCSpriteFrame *frame = CCSpriteFrame::createWithTexture(texture, CCRectMake(i % col * w, i / col * h, w, h));
        animation->addSpriteFrame(frame);
    }
    animation->setDelayPerUnit(0.05);
    animation->setLoops(-1);
    return  CCAnimate::create(animation);
}
void Enemy::Move() {
    switch (m_currDir) {
        case RIGHT:
            this->setPositionX(this->getPositionX() + m_speed);
            m_CurrDis += m_speed;
            if (m_CurrDis >= m_MaxDis) {
                m_currDir = LEFT;
                this->setRotationY(0);
            }
           
            break;
        case LEFT:
            this->setPositionX(this->getPositionX() - m_speed);
            m_CurrDis -= m_speed;
            if (m_CurrDis <= 0) {
                m_currDir = RIGHT;
                this->setRotationY(180);
            }
            break;
    }
}
void Enemy::update(float time) {
    this->Move();
}

CCRect Enemy::getCollisionArea() {
    CCRect rect = this->getSprite()->boundingBox();
    return CCRectMake(rect.getMinX() + this->getPositionX(), rect.getMinY() + this->getPositionY(), rect.size.width, rect.size.height);
}

