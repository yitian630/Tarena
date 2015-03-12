//
//  SelectMapNode.cpp
//  XiaoQianRun
//
//  Created by ZX on 13-12-9.
//
//

#include "SelectMapNode.h"
#include "SelectLevelLayer.h"
#include "SimpleAudioEngine.h"
using namespace CocosDenshion;
SelectMapNode* SelectMapNode::createSelectMapNode(int mapLevel) {
    SelectMapNode *node = new SelectMapNode();
    if (node && node->initSelectMapNode(mapLevel)) {
        node->autorelease();
        return node;
    }
    CC_SAFE_DELETE(node);
    return NULL;
}
bool SelectMapNode::initSelectMapNode(int mapLevel) {
    if (!OnClickNode::init()) return false;
    
    //选择的地图
    CCSprite *sprite = CCSprite::create(CCString::createWithFormat("ui/scene%d.png", mapLevel)->getCString());
    sprite->setAnchorPoint(CCPointZero);
    
    //地图名称
    CCSprite *name = CCSprite::create(CCString::createWithFormat("ui/zh-Hans/scene%d_logo.png", mapLevel)->getCString());
    name->setPosition(ccp(sprite->getContentSize().width * 0.5, sprite->getContentSize().height));
    sprite->addChild(name);
    //重新设置  精灵的尺寸   用于检测是否点中该精灵
    sprite->setContentSize(CCSizeMake(sprite->getContentSize().width, sprite->getContentSize().height + name->getContentSize().height * 0.5));
    //设置精灵为当前节点的 选中内容
    this->setShowContent(sprite);
    
    m_mapLevel = mapLevel;
    
    return true;
}




bool SelectMapNode::ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent) {
    m_isTouchInside = this->isTouchInside(pTouch);
    if (m_isTouchInside) {
        CCLog("%d   - ccTouchBegan", m_mapLevel);
    }
    return m_isTouchInside;
}
void SelectMapNode::ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent) {
    //开始移动  取消该节点的触摸
    m_isTouchInside = false;
    CCLog("ccTouchMoved");
}
void SelectMapNode::ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent) {
    if (m_isTouchInside) {
          SimpleAudioEngine::sharedEngine()->playEffect("music/button.wav");
        CCDirector::sharedDirector()->replaceScene(SelectLevelLayer::scene(m_mapLevel));
    CCLog("ccTouchEnded");
    }
}


