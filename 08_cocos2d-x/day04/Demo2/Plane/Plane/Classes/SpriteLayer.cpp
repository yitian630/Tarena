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
#include "Bullet.h"
#include "SimpleAudioEngine.h"
#include "Enemy.h"
using namespace CocosDenshion;
Spritelayer::~Spritelayer() {
    CC_SAFE_RELEASE(m_cloudPool);
}

bool Spritelayer::init() {
    if(!CCLayer::create()) return false;
    
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Game/sp_all.plist");
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Game/bullet_lv.plist");
    
    SimpleAudioEngine::sharedEngine()->setBackgroundMusicVolume(1);
    SimpleAudioEngine::sharedEngine()->setEffectsVolume(0.2);
    
    
    
    //创建 对象池对象
    m_cloudPool = CloudPool::create();
    CC_SAFE_RETAIN(m_cloudPool);
    
    //添加云
    this->schedule(schedule_selector(Spritelayer::addCloud), 2);
 

    
    //添加 玩家飞机
    m_plane = Plane::creatPlane(ccp(SCREEN.width * 0.5, 100));
    this->addChild(m_plane);
    
    //发射子弹
    this->schedule(schedule_selector(Spritelayer::shootBullet), 0.3);
    
    
    //添加 敌人
    this->schedule(schedule_selector(Spritelayer::addEnemy), 1);
    
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


//发射子弹
void Spritelayer::shootBullet() {
    SimpleAudioEngine::sharedEngine()->playEffect("effect_bullet.mp3");
    Bullet *bullet = Bullet::createBullet(ccpAdd(m_plane->getPosition(), ccp(0, 30)));
    this->addChild(bullet);
}


//添加敌人
void Spritelayer::addEnemy() {
    int type = (int)(CCRANDOM_0_1() * 100) % 3;
    float _speed = (int)(CCRANDOM_0_1() * 100) % 4 + 4;
    float x = CCRANDOM_0_1() * SCREEN.width;
    Enemy *enemy = Enemy::createEnemy(ccp(x, 580), (EnemyType)type, _speed);
    this->addChild(enemy);
}



