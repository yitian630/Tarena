//
//  SelectLevelButton.cpp
//  XiaoQianRun
//
//  Created by BFM on 13-12-9.
//
//

#include "SelectLevelButton.h"
#include "Defines.h"
#include "SimpleAudioEngine.h"
using namespace CocosDenshion;

SelectLevelButton* SelectLevelButton::createSelectLevelButton(int mapLevel, int Level) {
    SelectLevelButton *button = new SelectLevelButton();
    if (button && button->initSelectLevelButton(mapLevel, Level)) {
        button->autorelease();
        return button;
    }
    CC_SAFE_DELETE(button);
    return NULL;
}
bool SelectLevelButton::initSelectLevelButton(int mapLevel, int Level) {
    
    if (!OnClickNode::init()) return false;
    
    m_level = Level;
    m_mapLevel = mapLevel;
    
    //选关背景
    m_bg = CCSprite::create("ui/level.png");
    this->setShowContent(m_bg);

    
    //每关的数字
    CCSprite *levelIndex = CCSprite::create(CCString::createWithFormat("ui/levelindex/%d.png", Level)->getCString());
    levelIndex->setAnchorPoint(ccp(0, 1));
    levelIndex->setPosition(ccp(5, m_bg->getContentSize().height - 5));
    m_bg->addChild(levelIndex);
    
    //初始状态为加锁
    m_button_State = LOCK;
    
    lockSprite = CCSprite::create("ui/levelLock.png");
    lockSprite->setPosition(ccp(m_bg->getContentSize().width * 0.58, m_bg->getContentSize().height * 0.4));
    m_bg->addChild(lockSprite);
    
    
    return true;
}

//解锁
void SelectLevelButton::unLock() {
    m_button_State = UNLOCK;
    CCTexture2D *texture = CCTextureCache::sharedTextureCache()->addImage("ui/nopass.png");
    lockSprite->setTexture(texture);
}

//完成
void SelectLevelButton::finish(Grade grade) {
    m_button_State = FINISH;
    CCTexture2D *texture = NULL;
    switch ((int)grade) {
        case S:
            texture = CCTextureCache::sharedTextureCache()->addImage("ui/s.png");
            break;
        case A:
            texture = CCTextureCache::sharedTextureCache()->addImage("ui/a.png");
            break;
        case B:
            texture = CCTextureCache::sharedTextureCache()->addImage("ui/b.png");
            break;
        case C:
            texture = CCTextureCache::sharedTextureCache()->addImage("ui/c.png");
            break;
        case D:
            texture = CCTextureCache::sharedTextureCache()->addImage("ui/b.png");
            break;
            
    }
    lockSprite->setTexture(texture);
}


bool SelectLevelButton::ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent) {
    bool isTouch = this->isTouchInside(pTouch);
    if (isTouch) {
        SimpleAudioEngine::sharedEngine()->playEffect("music/button.wav");
        if (m_button_State == LOCK) {
             return false;
        }
        m_bg->setScale(1.2);
    }
    return isTouch;
}
void SelectLevelButton::ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent) {
    if (!this->isTouchInside(pTouch)) {
        m_bg->setScale(1);
    }
}
void SelectLevelButton::ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent) {
    if (this->isTouchInside(pTouch)) {
        m_bg->setScale(1);
        CCLog("跳转");
    }
}