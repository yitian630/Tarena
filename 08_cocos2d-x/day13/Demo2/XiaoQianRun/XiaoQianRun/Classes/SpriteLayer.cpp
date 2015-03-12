//
//  SpriteLayer.cpp
//  XiaoQianRun
//
//  Created by BFM on 13-12-2.
//
//

#include "SpriteLayer.h"
#include "MapLayer.h"
#include "SimpleAudioEngine.h"
#include "Gold.h"
#include "E_mm.h"
#include "E_lx.h"
using namespace CocosDenshion;

SpriteLayer::~SpriteLayer() {
    CC_SAFE_RELEASE(m_golds);
    CC_SAFE_RELEASE(m_enemys);
}

SpriteLayer* SpriteLayer::createSpriteLayer(int roleIndex, MapLayer *mapLayer) {
    SpriteLayer *spriteLayer = new SpriteLayer();
    if (spriteLayer && spriteLayer->initSpriteLayer(roleIndex, mapLayer)) {
        spriteLayer->autorelease();
        return spriteLayer;
    }
    CC_SAFE_DELETE(spriteLayer);
    return NULL;
}
bool SpriteLayer::initSpriteLayer(int roleIndex, MapLayer *mapLayer) {
    if (!CCLayer::init()) return false;
    
    m_golds = CCArray::create();
    CC_SAFE_RETAIN(m_golds);
    m_enemys = CCArray::create();
    CC_SAFE_RETAIN(m_enemys);
    
     //传入地图层对象
    m_mapLayer = mapLayer;
    
    
    //创建角色
    m_player = Player::createPlayer(roleIndex);
    this->addChild(m_player);
    m_player->setPosition(ccp(0, 600));

    //创建金币  创建多少个金币是看当前地图编辑文件中 金币的对象数组中  有多少元素
    CCArray *array = m_mapLayer->getGoldObjects();
    CCObject *object = NULL;
    CCARRAY_FOREACH(array, object) {
        CCDictionary *dic = (CCDictionary*)object;
        float x = dic->valueForKey("x")->floatValue();
        float y = dic->valueForKey("y")->floatValue();
        Gold *gold = Gold::createGold(ccp(x, y));
        this->addChild(gold);
        m_golds->addObject(gold);
    }
    
    //创建敌人
    CCArray *array1 = m_mapLayer->getEnemyObjects();
    CCARRAY_FOREACH(array1, object) {
        CCDictionary *dic = (CCDictionary*)object;
        float x = dic->valueForKey("x")->floatValue();
        float y = dic->valueForKey("y")->floatValue();
        const CCString *name = dic->valueForKey("enemyType");
        Enemy *enemy = NULL;
        if (name->compare("mm") == 0) {
            //创建妹妹
            enemy = E_mm::create();
        }
        if (name->compare("lx") == 0) {
            //创建龙虾
            enemy = E_lx::create();
        }
        if (enemy) {
            this->addChild(enemy);
            enemy->setPosition(ccp(x, y));
            m_enemys->addObject(enemy);
        }
    
    }

    
    //检测碰撞
    this->schedule(schedule_selector(SpriteLayer::collision_update), 0.016);
    
    //开启触摸
    this->setTouchEnabled(true);
    //设置单点触摸
    this->setTouchMode(kCCTouchesOneByOne);
    
    return true;
}

CCPoint SpriteLayer::getCurrentPlayerPoint() {
    return m_player->getPosition();
}


//检测碰撞的更新函数
void SpriteLayer::collision_update(float dt) {
    //判断 敌人 与 角色 碰撞
    for (int i = 0; i < m_enemys->count(); i++) {
        Enemy* enemy = (Enemy*)m_enemys->objectAtIndex(i);
        if (enemy->getCollisionArea().intersectsRect(m_player->getCollisionArea())) {
            m_player->setCurrentPlayerState(WILL_DIE);
            SimpleAudioEngine::sharedEngine()->playEffect("music/deathMusic.mp3");
            this->unscheduleAllSelectors();
            return;
        }
    }
    
    
    

//    /*判断金币是否与角色碰撞*/
    for (int i = 0; i < m_golds->count(); i++) {
        Gold *gold = (Gold*)m_golds->objectAtIndex(i);
    if (!gold->getCollision()) {
        if (gold->getCollisionArea().intersectsRect(m_player->getCollisionArea())) {
            //增加分数
            //调用金币隐藏方法
            gold->goldVanish();
            //添加音效
            SimpleAudioEngine::sharedEngine()->playEffect("music/goldMusic.mp3");
            }
        }
    }
    

    
    /*判断地图是否与角色碰撞 */
    CCObject *iteration = NULL;
    //从 MapLayer 取出的 地图块对象数组
    CCArray *tiledMap_collisionObject = this->getMapLayer()->getCollisionObjects();
    if (m_player->getCurrentPlayerState() != WILL_DIE) {
    //遍历 地图块对象数组 把每个地图块取出
    CCARRAY_FOREACH(tiledMap_collisionObject, iteration) {
        //每个地图碰撞区域的对象  得到 属性字典
        CCDictionary* propertys = (CCDictionary*)iteration;
        float x = propertys->valueForKey("x")->floatValue();
        float y = propertys->valueForKey("y")->floatValue();
        float width = propertys->valueForKey("width")->floatValue();
        float height = propertys->valueForKey("height")->floatValue();
        const CCString *die = propertys->valueForKey("die");


            
        //掉落悬崖
        if (die->compare("true") == 0) {
            if (m_player->getPositionY() <= y) {
                CCLog("已经掉到下面, 玩家失败");
                m_player->setCurrentPlayerState(WILL_DIE);
                SimpleAudioEngine::sharedEngine()->playEffect("music/deathMusic.mp3");
                return;
            }
        }
        
        //判断是否撞墙
        if (m_player->isCollisionWithCollArea(COLLISION_RIGHT, CCRectMake(x, y, width, height))){
            CCLog("角色撞到墙, 进入将要死亡状态   %d", m_player->getCurrentPlayerState());
            m_player->setCurrentPlayerState(WILL_DIE);
            SimpleAudioEngine::sharedEngine()->playEffect("music/deathMusic.mp3");
            return;
        };


        //角色掉到地上
        if (m_player->isCollisionWithCollArea(COLLISION_BOTTOM, CCRectMake(x, y, width, height))) {
            //已经掉到下面, 玩家失败
            if (m_player->getCurrentPlayerState() != MOVE) {
                m_player->setCurrentPlayerState(MOVE);
            }
            return;
        };
        
    }
    
    if (m_player->getCurrentPlayerState() == MOVE)
        //如果没有与任何碰撞对象碰撞,说明没有与地面解春,则将状态转换成落下状态
        m_player->setCurrentPlayerState(JUMP_DOWN);
    }
    
}

bool SpriteLayer::ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent) {
    
    float tempYspeed = ConstY_Speed;

  
    switch (m_player->getCurrentPlayerState()) {
        case MOVE:
            m_player->setCurrentPlayerState(JUMP_UP);
            m_player->setIsSecondaryJump(true);
            m_player->setYSpeed(tempYspeed);
              SimpleAudioEngine::sharedEngine()->playEffect("music/jumpMusic.mp3");
            break;
        case JUMP_UP:
            if (m_player->getIsSecondaryJump()) {
                m_player->setIsSecondaryJump(false);
                m_player->setCurrentPlayerState(JUMP_UP);
                m_player->setYSpeed(tempYspeed);
                  SimpleAudioEngine::sharedEngine()->playEffect("music/jumpMusic.mp3");
            }
            break;
        case JUMP_DOWN:
            if (m_player->getIsSecondaryJump()) {
                m_player->setIsSecondaryJump(false);
                m_player->setCurrentPlayerState(JUMP_UP);
                m_player->setYSpeed(tempYspeed);
            }
              break;
            
        default:
            break;
    }

    return true;
}



