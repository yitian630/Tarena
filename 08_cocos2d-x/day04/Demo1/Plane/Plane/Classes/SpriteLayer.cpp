//
//  SpriteLayer.cpp
//  Plane
//
//  Created by tarena on 14-6-10.
//
//

#include "SpriteLayer.h"
#include "Cloud.h"
#include "Tools.h"

Spritelayer::~Spritelayer() {
    CC_SAFE_RELEASE(m_cloudPool);
}

bool Spritelayer::init() {
    if(!CCLayer::create()) return false;
    
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Game/sp_all.plist");
    
    
    //创建 对象池对象
    m_cloudPool = CloudPool::create();
    CC_SAFE_RETAIN(m_cloudPool);
    
    //添加云
    this->schedule(schedule_selector(Spritelayer::addCloud), 2);
 

    
    //添加 玩家飞机
    m_plane = Plane::creatPlane(ccp(SCREEN.width * 0.5, 100));
    this->addChild(m_plane);
    
    //添加 敌人
    
    //开启触摸  （默认开启的是 多点触摸）
    this->setTouchEnabled(true);
    //设置为单点 触摸
    this->setTouchMode(kCCTouchesOneByOne);
    
    
    return true;
}

void Spritelayer::addCloud() {
    m_cloudPool->showCloud(this);
}


bool Spritelayer::ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent) {
    tempPosition = pTouch->getLocation();
//    //移动飞机
//    m_plane->setPosition(pTouch->getLocation());
    return true;
}
void Spritelayer::ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent) {
    
    CCPoint movePoint = ccpSub(pTouch->getLocation(), tempPosition);
    
    //移动飞机
    m_plane->setPosition(ccpAdd(m_plane->getPosition(), movePoint));
    
    tempPosition = pTouch->getLocation();
}
void Spritelayer::ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent) {
     CCLog("ccTouchEnded");
}





