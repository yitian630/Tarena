//
//  Enemy.cpp
//  Plane
//
//  Created by tarena on 14-6-11.
//
//

#include "Enemy.h"
Enemy* Enemy::createEnemy(CCPoint position, EnemyType type, float speed) {
    Enemy *enemy = new Enemy();
    if (enemy && enemy->initEnemy(position, type, speed)) {
        enemy->autorelease();
        return enemy;
    }
    CC_SAFE_DELETE(enemy);
    return NULL;
}
bool Enemy::initEnemy(CCPoint position, EnemyType type, float speed) {
    if (!CCNode::init()) return false;
    this->setPosition(position);
    m_speed = speed;
    
    m_showSprite = CCSprite::create();
    this->addChild(m_showSprite);
    //精灵运行动画  （根据类型创建动画）
    m_showSprite->runAction(this->createAnimate(type));
    
    this->scheduleUpdate();
    
    return true;
}
CCAnimate* Enemy::createAnimate(EnemyType type) {
    const char *imageNmae;
    switch (type) {
        case BUG:
            imageNmae = "enemy_bug.png";
            break;
        case DUCK:
            imageNmae = "enemy_duck.png";
            break;
        case PIG:
            imageNmae = "enemy_pig.png";
        break;    }
    
    
    CCAnimation *animation = CCAnimation::create();

    CCTexture2D *texture = CCTextureCache::sharedTextureCache()->addImage(imageNmae);
    for (int i = 0; i < 10; i++) {
        float w = texture->getContentSize().width / 10;
        CCSpriteFrame *frame = CCSpriteFrame::createWithTexture(texture, CCRectMake(w * i, 0, w, texture->getContentSize().height));
        
        animation->addSpriteFrame(frame);
    }
    animation->setDelayPerUnit(0.05);
    animation->setLoops(-1);
    return CCAnimate::create(animation);
}

void Enemy::removeEnemy() {
    this->unscheduleUpdate();
    this->removeFromParent();
}

void Enemy::update(float time) {
    this->setPositionY(this->getPositionY() - m_speed);
    if (this->getPositionY() <= -m_showSprite->getContentSize().height * 0.5) {
        this->removeFromParent();
    }
}


