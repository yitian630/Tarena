//
//  SelectLevelButton.cpp
//  BombHero
//
//  Created by tarena on 14-6-12.
//
//

#include "SelectLevelButton.h"
SelectLevelButton* SelectLevelButton::createButton(int Level) {
    SelectLevelButton *button = new SelectLevelButton();
    if (button && button->initButton(Level)) {
        button->autorelease();
        return button;
    }
    CC_SAFE_DELETE(button);
    return NULL;
}
bool SelectLevelButton::initButton(int Level) {
    if (!CCNode::init()) return false;
    
    m_level = Level;
    m_showSprite = CCSprite::createWithSpriteFrameName("selectLevel_itemBg.png");
    this->addChild(m_showSprite);
    
    //锁的精灵
    CCSprite *lock = CCSprite::createWithSpriteFrameName("selectLevel_lock.png");
    m_showSprite->addChild(lock);
    lock->setPosition(ccp(m_showSprite->getContentSize().width * 0.5, m_showSprite->getContentSize().height * 0.5));
    
    //默认所有锁都是 初始化都是上锁的
    m_isUnLock = false;

    return true;
}
void SelectLevelButton::onEnter() {
    CCNode::onEnter();
    CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(this, 0, false);
}
void SelectLevelButton::onExit() {
    CCNode::onExit();
    CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}
bool SelectLevelButton::ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent) {
    bool isTouch = this->isTouchInside(pTouch) && m_isUnLock;
    if (isTouch) {
        m_showSprite->setScale(1.2);
    }
    return isTouch;
}
void SelectLevelButton::ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent){
    if (!this->isTouchInside(pTouch)) {
        m_showSprite->setScale(1);
    }
    
}
void SelectLevelButton::ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent){
    m_showSprite->setScale(1);
    if (this->isTouchInside(pTouch)) {
        CCDirector::sharedDirector()->replaceScene(CCTransitionFade::create(1, GameScene::createGameScene(m_level)));
    }
}

//判断 点 是否在 背景精灵上
bool SelectLevelButton::isTouchInside(CCTouch *pTouch) {
    //把从Touch中取出位置 转换到 精灵坐标系下
    CCPoint point = m_showSprite->convertToNodeSpace(pTouch->getLocation());
    CCRect rect = CCRectMake(0, 0, m_showSprite->getContentSize().width, m_showSprite->getContentSize().height);
    if (rect.containsPoint(point)) {
        return true;
    }
    return false;
}

//解锁
void SelectLevelButton::openLock() {
    m_isUnLock = true;
    m_showSprite->removeAllChildren();
    CCLabelBMFont *bmFont = CCLabelBMFont::create(CCString::createWithFormat("%d", m_level)->getCString(), "SelectLevel/selectLevel_num.fnt");
    m_showSprite->addChild(bmFont);
    bmFont->setPosition(ccp(m_showSprite->getContentSize().width*0.5, m_showSprite->getContentSize().height * 0.5));
}


