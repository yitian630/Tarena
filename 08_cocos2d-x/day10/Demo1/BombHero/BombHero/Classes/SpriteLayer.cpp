//
//  SpriteLayer.cpp
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#include "SpriteLayer.h"
#include "Enemy1.h"
#include "Enemy2.h"
#include "Hero.h"
#include "MapLayer.h"
#include "Defines.h"
#include "Bomb.h"
#include "Explosion.h"
#include "SimpleAudioEngine.h"
using namespace CocosDenshion;

SpriteLayer::~SpriteLayer() {
    CC_SAFE_RELEASE(m_enemys);
    CC_SAFE_RELEASE(m_explosions);
    CC_SAFE_RELEASE(m_removeExplosions);
}
bool SpriteLayer::init() {
    if (!CCLayer::init()) {
        return false;
    }
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Plist/enemy1.plist");
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Plist/enemy2.plist");
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Plist/Hero1.plist");
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Plist/bomb.plist");
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Plist/Explosion.plist");

    
    m_enemys = CCArray::create();
    CC_SAFE_RETAIN(m_enemys);
    m_explosions = CCArray::create();
    CC_SAFE_RETAIN(m_explosions);
    m_removeExplosions = CCArray::create();
    CC_SAFE_RETAIN(m_removeExplosions);
    
    return true;
}

void SpriteLayer::initRole() {
    
    CCArray *objects = this->getMapLayer()->getObjectArr();
    for (int i = 0; i < objects->count(); i++) {
        CCDictionary *dic = (CCDictionary*)objects->objectAtIndex(i);
        //从字典中把 每个对象的属性取出来
        float x = dic->valueForKey("x")->floatValue() + 30;
        float y = dic->valueForKey("y")->floatValue() - 59;
        float speed = dic->valueForKey("speed")->floatValue();
        Role_Dir dir = (Role_Dir)dic->valueForKey("direction")->intValue();
        const CCString *name = dic->valueForKey("objectName");
        
        
        if (name->compare("hero") == 0) {
            m_hero = Hero::create();
            this->addChild(m_hero);
            m_hero->setPosition(ccp(x, y));
            m_hero->setROleDir(dir);
            m_hero->setSpeed(speed);
            m_hero->runRole_StandAnimation();
        }
        
        
        Role *enemy = NULL;
        if (name->compare("enemy1") == 0) {
            enemy = Enemy1::create();
        }else if(name->compare("enemy2") == 0) {
            enemy = Enemy2::create();
        }
        if (enemy) {
            enemy->setPosition(ccp(x, y));
            enemy->setSpeed(speed);
            enemy->runRole_MoveAnimation(dir);
            this->addChild(enemy);
            m_enemys->addObject(enemy);
        }
    }
    
    this->scheduleUpdate();
}

 void SpriteLayer::touchBegan_de(CCObject *rocker, RockerDirection dir) {
     m_hero->runRole_MoveAnimation((Role_Dir)dir);
     
     }
 void SpriteLayer::touchMove_de(CCObject *rocker, RockerDirection dir) {
     m_hero->runRole_MoveAnimation((Role_Dir)dir);
}
 void SpriteLayer::touchEnd_de(CCObject *rocker, RockerDirection dir) {
     //运行角色站立的动画
     m_hero->runRole_StandAnimation();
}

void SpriteLayer::heroMove() {
    if (m_hero->getRoleState() == Role_Move) {
        CCPoint movePoint = m_hero->roleMove();
        if (this->isTileCollisionRole(m_hero)) {
            //英雄撞墙 退回一步
            m_hero->roleBackMove();
        } else {
        bool isMove = false;
        switch ((int)m_hero->getROleDir()) {
            case Role_UP:
            case Role_Down:
                if (m_hero->getPositionY() <= this->getMapLayer()->getMapSize().height - SCREEN.height * 0.5 && m_hero->getPositionY() > SCREEN.height * 0.5) {
                    isMove = true;
                }
                break;
            case Role_Left:
            case Role_Right:
                if (m_hero->getPositionX() <= this->getMapLayer()->getMapSize().width - SCREEN.width * 0.5 && m_hero->getPositionX() > SCREEN.width * 0.5) {
                    isMove = true;
                }
                break;


        }
        if (isMove) {
            this->getMapLayer()->moveMap(ccp(-movePoint.x, -movePoint.y));
        }
    }
    }
}


void SpriteLayer::update(float time) {
    if (m_hero->getRoleState() == Role_Die) {
        //游戏输了
        this->GameLose();
        this->unscheduleUpdate();
    }
    if (m_enemys->count() == 0) {
        this->GameWin();
        this->unscheduleUpdate();
    }
    
    //英雄移动
    this->heroMove();
    //敌人移动
    this->enemyMove();
    //如果敌人 与 英雄碰撞， 英雄进入将要死亡状态
    if (m_hero->getRoleState() != Role_WillDie && this->enemyCollisionHero()) {
        this->stopRocker();
        m_hero->runRole_WillDie();
        return;
    }
    
    //遍历炸弹都炸到了 谁
    this->detectionExplosion();
    //清空不需要的对象
    this->removeObject();
}

MapLayer* SpriteLayer::getMapLayer() {
    return (MapLayer*)this->getParent();
}

bool SpriteLayer::isTileCollisionRole(Role *role) {
    CCRect collisionArea = role->getCollisionArea();
    MapLayer *mapLayer = this->getMapLayer();
    //角色碰撞区域的左下角 是否 与地图碰撞
    if (mapLayer->isTileCollision(collisionArea.origin)) {
        return true;
    }
    //右下角
    if (mapLayer->isTileCollision(ccpAdd(collisionArea.origin, ccp(collisionArea.size.width, 0)))) {
        return true;
    }
    //左上
    if (mapLayer->isTileCollision(ccpAdd(collisionArea.origin, ccp(0, collisionArea.size.height)))) {
        return true;
    }
    //右上
    if (mapLayer->isTileCollision(ccpAdd(collisionArea.origin, ccp(collisionArea.size.width, collisionArea.size.height)))) {
        return true;
    }
    return false;
}

void SpriteLayer::enemyMove() {
    for (int i = 0; i < m_enemys->count(); i++) {
        Role *enemy = (Role*)m_enemys->objectAtIndex(i);
        if (enemy->getRoleState() == Role_Move) {
            enemy->roleMove();
            if (this->isTileCollisionRole(enemy)) {
                enemy->roleBackMove();
                Role_Dir changeDir;
                switch ((int)enemy->getROleDir()) {
                    case Role_UP:
                        changeDir = Role_Down;
                        break;
                    case Role_Down:
                        changeDir = Role_UP;
                        break;
                    case Role_Left:
                        changeDir = Role_Right;
                        break;
                    case Role_Right:
                        changeDir = Role_Left;
                        break;
                }
                enemy->runRole_MoveAnimation(changeDir);
            }
        }
    }
}

void SpriteLayer::shootBomb(CCObject *sender) {
    SimpleAudioEngine::sharedEngine()->playEffect("snd/put_bomb.mp3");
    
    MapLayer *mapLayer = this->getMapLayer();
    //求出英雄腰部所在 地图的 行列
    CCPoint tileCoord = mapLayer->tileCoordForPosition(ccpAdd(m_hero->getPosition(), ccp(0, 20)));
    //求出 指定 行列图块  左上角的位置
    CCPoint position = mapLayer->positionForTileCoord(tileCoord);
    
    Bomb *bomb = Bomb::createBomb(ccp(position.x + 30, position.y - 30));
    this->addChild(bomb, -1);
}
//炸弹爆炸
void SpriteLayer::bombExplosion(CCPoint position) {
     SimpleAudioEngine::sharedEngine()->playEffect("snd/bomb_explode.mp3");
    Explosion *explosion = Explosion::createExplosion(position);
    this->addChild(explosion);
    m_explosions->addObject(explosion);
}


bool SpriteLayer::explosionCollisionRole(Explosion *explosion, Role *role) {
    MapLayer *mapLayer = this->getMapLayer();
    CCPoint tileCoord = mapLayer->tileCoordForPosition(explosion->getPosition());
    CCPoint tileCoord_UP = ccpAdd(tileCoord, ccp(0, -1));
    CCPoint tileCoord_DOWN = ccpAdd(tileCoord, ccp(0, 1));
    CCPoint tileCoord_LEFT = ccpAdd(tileCoord, ccp(-1, 0));
    CCPoint tileCoord_RIGHT = ccpAdd(tileCoord, ccp(1, 0));
    CCPoint allTileCoord[5] = {tileCoord, tileCoord_UP, tileCoord_DOWN, tileCoord_LEFT, tileCoord_RIGHT};
    for (int i = 0; i < 5; i++) {
        CCPoint origin = ccpAdd(mapLayer->positionForTileCoord(allTileCoord[i]), ccp(0, -60));
        CCSize size = CCSizeMake(60, 60);
        CCRect collisionRect = CCRectMake(origin.x, origin.y, size.width, size.height);
        if (collisionRect.intersectsRect(role->getCollisionArea())) {
            return true;
        }
    }
    return false;
}

//遍历 炸弹 都炸到了谁
void SpriteLayer::detectionExplosion() {
    for (int i = 0; i < m_explosions->count(); i++) {
        Explosion *explosion = (Explosion*)m_explosions->objectAtIndex(i);
        
        //判断是否炸到英雄
        if (m_hero->getRoleState() != Role_WillDie) {
            if (this->explosionCollisionRole(explosion, m_hero)) {
                SimpleAudioEngine::sharedEngine()->playEffect("snd/monster_dead.mp3");
                //停止摇杆  和  按键 操作
                this->stopRocker();
                m_hero->runRole_WillDie();
            }
        }
        
        //判断是否炸到敌人
        for (int j = 0; j < m_enemys->count(); j++) {
            Role *enemy = (Role*)m_enemys->objectAtIndex(j);
            if (enemy->getRoleState() != Role_WillDie) {
                if (this->explosionCollisionRole(explosion, enemy)) {
                    SimpleAudioEngine::sharedEngine()->playEffect("snd/monster_dead.mp3");
                    enemy->runRole_WillDie();
                }
            }
        }
    }
}

void SpriteLayer::removeObject() {
    //清楚不需要的  爆炸对象
    for (int i = 0; i < m_removeExplosions->count(); i++) {
        Explosion *explosion = (Explosion*)m_removeExplosions->objectAtIndex(i);
        m_explosions->removeObject(explosion);
    }
    m_removeExplosions->removeAllObjects();
    
    
    //清理敌人
    CCArray *removeEnemys = CCArray::create();
    for (int i = 0; i < m_enemys->count(); i++) {
        Role *enemy = (Role*)m_enemys->objectAtIndex(i);
        if (enemy->getRoleState() == Role_Die) {
            //清理该敌人
            removeEnemys->addObject(enemy);
        }
    }
    for (int i = 0; i < removeEnemys->count(); i ++) {
        Role *enemy = (Role*)removeEnemys->objectAtIndex(i);
        
        this->removeChild(enemy);
        m_enemys->removeObject(enemy); 
    }
    removeEnemys->removeAllObjects();
    
}


void SpriteLayer::GameWin() {
     SimpleAudioEngine::sharedEngine()->playEffect("snd/ui_shengli.mp3");
    SimpleAudioEngine::sharedEngine()->stopBackgroundMusic();
    this->getMapLayer()->GameWin();
}
void SpriteLayer::GameLose() {
    SimpleAudioEngine::sharedEngine()->playEffect("snd/ui_shibai.mp3");
    SimpleAudioEngine::sharedEngine()->stopBackgroundMusic();
    this->getMapLayer()->GameLose();
}
void SpriteLayer::stopRocker() {
    this->getMapLayer()->stopRocker();
}

//检测 敌人是否碰到英雄
bool SpriteLayer::enemyCollisionHero() {
    for (int i = 0; i < m_enemys->count(); i++) {
        Role *enemy = (Role*)m_enemys->objectAtIndex(i);
        if (enemy->getCollisionArea().intersectsRect(m_hero->getCollisionArea())) {
            return true;
            }
        }
    return false;
}
