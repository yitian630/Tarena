//
//  Cloud.cpp
//  Plane
//
//  Created by tarena on 14-6-10.
//
//

#include "Cloud.h"
bool Cloud::init() {
    if (!CCNode::init()) return false;
    m_showSprite = CCSprite::create("BG/img_cloud_1.png");
    this->addChild(m_showSprite);
    
    //用精灵的大小 来 设置节点的大小
    this->setContentSize(m_showSprite->getContentSize());

    m_isShow = false;

    return true;
}

void Cloud::show() {
    m_isShow = true;
    this->scheduleUpdate();
}
void Cloud::hide() {
    m_isShow = false;
    this->unscheduleUpdate();
    this->removeFromParent();
}


void Cloud::update(float time) {
    this->setPositionY(this->getPositionY() - m_speed);
    if (this->getPositionY() <= -this->getContentSize().height * 0.5) {
        this->hide();
    }
}







