//
//  OnClickNode.cpp
//  XiaoQianRun
//
//  Created by BFM on 13-12-9.
//
//

#include "OnClickNode.h"

void OnClickNode::setShowContent(CCSprite *showContent) {
    m_sprite = showContent;
    this->addChild(m_sprite);
}

CCSize OnClickNode::getShowContentSize() {
    if (m_sprite) {
        return m_sprite->getContentSize();
    }
    return CCSizeZero;
}

void OnClickNode::onEnter() {
    CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(this, 0, false);
}
void OnClickNode::onExit() {
    CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

// 触摸点是否在精灵上
bool OnClickNode::isTouchInside(CCTouch* touch) {
    bool isTouched = false;
    if (m_sprite) {
        CCPoint point = touch->getLocation();
        CCPoint localPos = m_sprite->convertToNodeSpace(point);
        CCRect rect = CCRectMake(0,
                                 0,
                                 m_sprite->getContentSize().width,
                                 m_sprite->getContentSize().height);
        isTouched = rect.containsPoint(localPos);
    }
    return isTouched;
}
