//
//  RockerButton.cpp
//  BombHero
//
//  Created by tarena on 14-6-13.
//
//

#include "RockerButton.h"
/********* 普通按键 ************/
RockerButton* RockerButton::creatButton(const char* buttonImageName, CCPoint position, CCObject *target,FUNCTION_NAME funtion) {
    RockerButton *button = new RockerButton();
    if (button && button->initButton(buttonImageName, position, target, funtion)) {
        button->m_bType = BUTTON;
        button->autorelease();
        return button;
    }
    CC_SAFE_DELETE(button);
    return NULL;
}
bool RockerButton::initButton(const char* buttonImageName, CCPoint position, CCObject *target,FUNCTION_NAME funtion) {
    if (!CCNode::init()) return false;
    
    m_target = target;
    m_funtion = funtion;
    
    this->setPosition(position);
    
    m_showSprite = CCSprite::create(buttonImageName);
    this->addChild(m_showSprite);
    m_showSprite->setVisible(false);
    
    return true;
}

/********* 换图按键 ************/
RockerButton* RockerButton::creatButtonWithChangeImage(const char* buttonImageName, const char* selectImageName, CCPoint position, CCObject *target,FUNCTION_NAME m_funtion) {
    RockerButton *button = RockerButton::creatButton(buttonImageName, position, target, m_funtion);
    if (button) {
        button->m_showSprite1 = CCSprite::create(selectImageName);
        button->m_showSprite1->setVisible(false);
        button->addChild(button->m_showSprite1);
        button->m_bType = CHANGE_BUTTON;
    }
    return button;
}

void RockerButton::startButton() {
    CCDirector::sharedDirector()->getTouchDispatcher()->addStandardDelegate(this, 0);
    m_showSprite->setVisible(true);
}
void RockerButton::stopButton() {
    CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
    m_showSprite->setVisible(false);
}

bool RockerButton::isTouchInside(CCTouch *pTouch) {
    //把从Touch中取出位置 转换到 精灵坐标系下
    CCPoint point = m_showSprite->convertToNodeSpace(pTouch->getLocation());
    CCRect rect = CCRectMake(0, 0, m_showSprite->getContentSize().width, m_showSprite->getContentSize().height);
    if (rect.containsPoint(point)) {
        return true;
    }
    return false;
}
// optional
void RockerButton::ccTouchesBegan(CCSet *pTouches, CCEvent *pEvent) {
    //把 pTouches 里的第一个元素 取到  交给迭代器
    CCSetIterator iter = pTouches->begin();
    //循环取出 pTouches 所有元素，直到最后一个元素的下一个位置结束
    while (iter != pTouches->end()) {
        //通过 迭代器对象 得到 Touch 对象
        CCTouch *touch = (CCTouch*)(*iter);
        //判断是哪个点  点中的精灵
        if (this->isTouchInside(touch)){
            m_tempTouchId = touch->getID();
            switch (m_bType) {
                case BUTTON:
                    if (m_target && m_funtion) {
                        (m_target->*m_funtion)(this);
                    }
                    break;
                case CHANGE_BUTTON:
                    m_showSprite->setVisible(false);
                    m_showSprite1->setVisible(true);
//                case Scale:
//                    m_showSprite->setScale(1.2);
                    break;
            }
            break;
        }
        iter++;
    }
}
void RockerButton::ccTouchesMoved(CCSet *pTouches, CCEvent *pEvent) {
    //把 pTouches 里的第一个元素 取到  交给迭代器
    CCSetIterator iter = pTouches->begin();
    //循环取出 pTouches 所有元素，直到最后一个元素的下一个位置结束
    while (iter != pTouches->end()) {
        //通过 迭代器对象 得到 Touch 对象
        CCTouch *touch = (CCTouch*)(*iter);
        if (m_tempTouchId == touch->getID()) {
            //判断是哪个点  点中的精灵
            if (!this->isTouchInside(touch)){
                switch (m_bType) {
                    case BUTTON:
                        break;
                    case CHANGE_BUTTON:
                        m_showSprite->setVisible(true);
                        m_showSprite1->setVisible(false);
                        break;
                }
                break;
            }
        }
        iter++;
    }
}
void RockerButton::ccTouchesEnded(CCSet *pTouches, CCEvent *pEvent) {
    //把 pTouches 里的第一个元素 取到  交给迭代器
    CCSetIterator iter = pTouches->begin();
    //循环取出 pTouches 所有元素，直到最后一个元素的下一个位置结束
    while (iter != pTouches->end()) {
        //通过 迭代器对象 得到 Touch 对象
        CCTouch *touch = (CCTouch*)(*iter);
        if (m_tempTouchId == touch->getID()) {
            //判断是哪个点  点中的精灵
            if (this->isTouchInside(touch)){
                switch (m_bType) {
                    case BUTTON:
                        break;
                    case CHANGE_BUTTON:
                        m_showSprite->setVisible(true);
                        m_showSprite1->setVisible(false);
                        
                        if (m_target && m_funtion) {
                            (m_target->*m_funtion)(this);
                        }
                        
                        break;
                }
                break;
            }
        }
        iter++;
    }
}





