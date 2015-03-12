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
    CC_SAFE_RELEASE(m_enemys);
    CC_SAFE_RELEASE(m_bullets);
    CC_SAFE_RELEASE(m_removeEnemys);
    CC_SAFE_RELEASE(m_removeBullets);
}

bool Spritelayer::init() {
    if(!CCLayer::create()) return false;
    
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Game/sp_all.plist");
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Game/bullet_lv.plist");
    
    m_bullets = CCArray::create();
    CC_SAFE_RETAIN(m_bullets);
    
    m_enemys = CCArray::create();
    CC_SAFE_RETAIN(m_enemys);
    
    m_removeBullets = CCArray::create();
    CC_SAFE_RETAIN(m_removeBullets);
    
    m_removeEnemys = CCArray::create();
    CC_SAFE_RETAIN(m_removeEnemys);
    
    SimpleAudioEngine::sharedEngine()->setBackgroundMusicVolume(0.6);
    SimpleAudioEngine::sharedEngine()->setEffectsVolume(0.3);
    
    
    
    //创建 对象池对象
    m_cloudPool = CloudPool::create();
    CC_SAFE_RETAIN(m_cloudPool);
    
    //添加云
    this->schedule(schedule_selector(Spritelayer::addCloud), 2);
 

    
    //添加 玩家飞机
    m_plane = Plane::creatPlane(ccp(SCREEN.width * 0.5, 100));
    this->addChild(m_plane);
    
    //发射子弹
    this->schedule(schedule_selector(Spritelayer::shootBullet), 0.5);
    
    
    //添加 敌人
    this->schedule(schedule_selector(Spritelayer::addEnemy), 0.5);
    
    //开启触摸  （默认开启的是 多点触摸）
    this->setTouchEnabled(true);
    //设置为单点 触摸
    this->setTouchMode(kCCTouchesOneByOne);
    
    
    this->scheduleUpdate();
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
    m_bullets->addObject(bullet);
}


//添加敌人
void Spritelayer::addEnemy() {
    int type = (int)(CCRANDOM_0_1() * 100) % 3;
    float _speed = (int)(CCRANDOM_0_1() * 100) % 4 + 4;
    float x = CCRANDOM_0_1() * SCREEN.width;
    Enemy *enemy = Enemy::createEnemy(ccp(x, 530), (EnemyType)type, _speed);
    this->addChild(enemy);
    m_enemys->addObject(enemy);
}

//子弹与敌人  的 碰撞处理
void Spritelayer::bulletCollisionEnemy() {
    for (int i = 0; i < m_bullets->count(); i++) {
        Bullet *bullet = (Bullet*)m_bullets->objectAtIndex(i);
        for (int j = 0; j < m_enemys->count(); j++) {
            Enemy *enemy = (Enemy*)m_enemys->objectAtIndex(j);
            if (bullet->getCollision_Area().intersectsRect(enemy->getCollision_Area())) {
                SimpleAudioEngine::sharedEngine()->playEffect("effect_boom.mp3");
                
                CCParticleSystemQuad *particle = CCParticleSystemQuad::create("particle_boom.plist");
                this->addChild(particle);
                particle->setPosition(enemy->getPosition());
                particle->setAutoRemoveOnFinish(true);

                bullet->removeBullet();
                enemy->removeEnemy();
                break;
            }
        }
    }
}

void Spritelayer::update(float time) {
    this->bulletCollisionEnemy();
    
    this->removeObject();
}



void Spritelayer::removeObject() {
    for (int i = 0; i < m_removeBullets->count(); i++) {
        Bullet *bullet = (Bullet*)m_removeBullets->objectAtIndex(i);
        m_bullets->removeObject(bullet);
    }
    m_removeBullets->removeAllObjects();
    
    
    
    for (int i = 0; i < m_removeEnemys->count(); i++) {
        Enemy *enemy = (Enemy*)m_removeEnemys->objectAtIndex(i);
        m_enemys->removeObject(enemy);
    }
    m_removeEnemys->removeAllObjects();
    
}




