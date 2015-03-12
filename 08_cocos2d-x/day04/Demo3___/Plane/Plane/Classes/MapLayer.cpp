//
//  MapLayer.cpp
//  Plane
//
//  Created by tarena on 14-6-10.
//
//

#include "MapLayer.h"
#include "SimpleAudioEngine.h"
using namespace CocosDenshion;

MapLayer* MapLayer::createMapLayer(int level) {
    MapLayer *mapLayer = new MapLayer();
    if (mapLayer && mapLayer->initMapLayer(level)) {
        mapLayer->autorelease();
        return mapLayer;
    }
    CC_SAFE_DELETE(mapLayer);
    return NULL;
}
bool MapLayer::initMapLayer(int level) {
    if(!CCLayer::init()) return false;
    
    SimpleAudioEngine::sharedEngine()->playBackgroundMusic("TheDawn.mp3", true);
    
    m_bg1 = CCSprite::create(CCString::createWithFormat("BG/img_bg_level_%d.jpg", level)->getCString());
    m_bg2 = CCSprite::createWithTexture(m_bg1->getTexture());
    this->addChild(m_bg1);
    this->addChild(m_bg2);
    m_bg1->setAnchorPoint(CCPointZero);
    m_bg2->setAnchorPoint(CCPointZero);
    m_bg2->setPositionY(m_bg1->getContentSize().height);
    
    this->scheduleUpdate();
    
    return true;
}

void MapLayer::update(float time) {
    m_bg1->setPositionY(m_bg1->getPositionY() - 1);
    m_bg2->setPositionY(m_bg2->getPositionY() - 1);
    
    //如果出了屏幕  移动到上面
    if (m_bg1->getPositionY() <= -m_bg1->getContentSize().height) {
        m_bg1->setPositionY(m_bg2->getContentSize().height + m_bg2->getPositionY());
    }
    if (m_bg2->getPositionY() <= -m_bg2->getContentSize().height) {
        m_bg2->setPositionY(m_bg1->getContentSize().height + m_bg1->getPositionY());
    }
}


