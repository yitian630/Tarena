//
//  SelectButton.cpp
//  XiaoQianRun
//
//  Created by ZX on 13-12-9.
//
//

#include "SelectButton.h"
#include "MapLayer.h"
#include "SimpleAudioEngine.h"
using namespace CocosDenshion;
SelectButton* SelectButton::createSelectButton(int mapLevel, int Level, int roleIndex) {
    SelectButton *button = new SelectButton();
    if (button && button->initSelectButton(mapLevel, Level, roleIndex)) {
        button->autorelease();
        return button;
    }
    CC_SAFE_DELETE(button);
    return NULL;
}
bool SelectButton::initSelectButton(int mapLevel, int Level, int roleIndex) {
    if(!OnClickNode::init()) return false;
    m_mapLevel = mapLevel;
    m_Level = Level;
    m_roleIndex = roleIndex;
    
    
    m_role = CCSprite::create(CCString::createWithFormat("ui/person/person%d.png", roleIndex)->getCString());
    this->setShowContent(m_role);
    
    
    //选中后的背景光圈
    m_role_light = CCSprite::create("ui/huang.png");
    this->addChild(m_role_light, -1);
    m_role_light->setScale(2.3);
    m_role_light->setPosition(m_role->getPosition());
    m_role_light->setVisible(false);
    
    
    CCSprite *name = CCSprite::create(CCString::createWithFormat("ui/person/name%d.png", roleIndex)->getCString());
    name->setAnchorPoint(ccp(0.5, 1));
    name->setPosition(ccp(m_role->getContentSize().width * 0.5, -20));
    m_role->addChild(name);
    

    
    return true;
}

bool SelectButton::ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent) {
    bool isTouch = this->isTouchInside(pTouch);
    if (isTouch) {
        SimpleAudioEngine::sharedEngine()->playEffect("music/button.wav");
        if (m_roleIndex == 0) {
            return false;
        }
        //显示光圈
        m_role_light->setVisible(true);
    }
    return isTouch;
}
void SelectButton::ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent) {
    if (!this->isTouchInside(pTouch)) {
        //光圈消失
        m_role_light->setVisible(false);
    }

}
void SelectButton::ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent) {
    if (isTouchInside(pTouch)) {
          //光圈消失
        m_role_light->setVisible(false);
        
        CCDirector::sharedDirector()->replaceScene(MapLayer::scene(m_mapLevel, m_Level, m_roleIndex));
    }
}






