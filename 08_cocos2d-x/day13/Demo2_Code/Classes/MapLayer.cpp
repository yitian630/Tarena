//
//  MapLayer.cpp
//  XiaoQianRun
//
//  Created by apple_developer on 13-11-29.
//
//

#include "MapLayer.h"
#include "GameData.h"
#include "SimpleAudioEngine.h"
using namespace CocosDenshion;

MapLayer::~MapLayer() {
 
}

CCScene* MapLayer::scene(int mapLevel, int Level, int roleIndex) {
    CCScene *scene = CCScene::create();
    MapLayer *mapLayer = MapLayer::create();
    mapLayer->initMapLayer(mapLevel, Level, roleIndex);
    scene->addChild(mapLayer);
    return scene;
}


bool MapLayer::initMapLayer(int mapLevel, int Level, int roleIndex) {
    if (!CCLayer::init()) return false;
    
    SimpleAudioEngine::sharedEngine()->playBackgroundMusic("music/game.mp3", true);
    
    m_mapLevel = mapLevel;
    m_Level = Level;
    m_roleIndex = roleIndex;

    
    m_mapPoint_before = CCPointZero;
    
    tempX = 0;
    
    //初始化背景地图
    this->initBackGround();
    
    //初始化瓦块地图相关
    this->initTiledMap();
    
    
    //创建精灵层
    m_spriteLayer = SpriteLayer::createSpriteLayer(roleIndex, this);
    //这里要把精灵层加到  地图块的图层上  应为所有精灵要随地图移动而移动
    m_tiledMap->addChild(m_spriteLayer, 100);
    //根据角色设置地图位置
    this->setMapPoint();

    this->schedule(schedule_selector(MapLayer::moveMapUpdate), 0.016);

    return true;
}


//初始化背景图片
void MapLayer::initBackGround() {
    CCSprite* bg = CCSprite::create(CCString::createWithFormat("background/%d.jpg",m_mapLevel)->getCString());
    bg->setAnchorPoint(ccp(0, 0));
    this->addChild(bg);
    
    //远景背景1
    _distanceBg1 = CCSprite::create(CCString::createWithFormat("distant/%d/1.png",m_mapLevel)->getCString());
    _distanceBg1->setAnchorPoint(ccp(0, 0));
    this->addChild(_distanceBg1);
    //远景背景2
    _distanceBg2 = CCSprite::create(CCString::createWithFormat("distant/%d/2.png",m_mapLevel)->getCString());
    _distanceBg2->setAnchorPoint(ccp(0, 0));
    _distanceBg2->setPosition(ccp(_distanceBg1->getContentSize().width, 0));
    this->addChild(_distanceBg2);
    
    
    //近景背景1
    _vicinityBg1 = CCSprite::create(CCString::createWithFormat("distant/%d/%d_1.png",m_mapLevel, m_mapLevel)->getCString());
    if(_vicinityBg1) {
        _vicinityBg1->setAnchorPoint(ccp(0, 0));
        this->addChild(_vicinityBg1);
    }
    //近景背景2
    _vicinityBg2 = CCSprite::create(CCString::createWithFormat("distant/%d/%d_2.png",m_mapLevel, m_mapLevel)->getCString());
    if(_vicinityBg2) {
        _vicinityBg2->setAnchorPoint(ccp(0, 0));
        _vicinityBg2->setPosition(ccp(_vicinityBg1->getContentSize().width, 0));
        this->addChild(_vicinityBg2);
    }
}


//初始化瓦块地图相关
void MapLayer::initTiledMap() {

    //解析地图文件  创建  CCTMXTiledMap 对象
    m_tiledMap = CCTMXTiledMap::create(CCString::createWithFormat("map/map%d_%d.tmx", m_mapLevel, m_Level)->getCString());
    this->addChild(m_tiledMap);
    //TiledMap 地图尺寸
    m_mapSize = CCSize(m_tiledMap->getTileSize().width * m_tiledMap->getMapSize().width, m_tiledMap->getTileSize().height * m_tiledMap->getMapSize().height);
    
    CCTMXObjectGroup *objectGroup_collision = m_tiledMap->objectGroupNamed("collision");
    
    //地图块碰撞对象 数组
    collisionObjects = objectGroup_collision->getObjects();
    
    //获取 金币对象组对象
     CCTMXObjectGroup *objectGroup_gold = m_tiledMap->objectGroupNamed("gold");
    goldObjects = objectGroup_gold->getObjects();
    
    
    //获取 敌人对象组
     CCTMXObjectGroup *enemyGroup_gold = m_tiledMap->objectGroupNamed("enemy");
    enemyObjects = enemyGroup_gold->getObjects();
}


//移动地图
void MapLayer::moveMap(CCPoint toPoint){
    m_tiledMap->setPosition(toPoint);
    //计算层移动的距离
    CCPoint distance = ccpSub(toPoint, m_mapPoint_before);
    m_mapPoint_before = toPoint;
    //远景背景移动
    _distanceBg1->setPosition(ccpAdd(_distanceBg1->getPosition(), ccp(distance.x / 5.0, 0)));
    _distanceBg2->setPosition(ccpAdd(_distanceBg2->getPosition(), ccp(distance.x / 5.0, 0)));
    if(_vicinityBg1 && _vicinityBg2) {
        //近景背景移动
        _vicinityBg1->setPosition(ccpAdd(_vicinityBg1->getPosition(), ccp(distance.x / 2.0, 0)));
        _vicinityBg2->setPosition(ccpAdd(_vicinityBg2->getPosition(), ccp(distance.x / 2.0, 0)));
        this->moveMapOfBackGround( _vicinityBg1, _vicinityBg2);
        this->moveMapOfBackGround( _vicinityBg2, _vicinityBg1);
    }

    this->moveMapOfBackGround( _distanceBg1, _distanceBg2);
    this->moveMapOfBackGround( _distanceBg2, _distanceBg1);
}

//地图的更新方法
void MapLayer::moveMapUpdate(float dt) {
    this->setMapPoint();
}

    //背景地图如果移除屏幕放在屏幕后等待滚动
void MapLayer::moveMapOfBackGround(CCSprite *move, CCSprite *target){
    if (move->getPositionX() <= -move->getContentSize().width) {
        move->setPosition(ccp(target->getPositionX() + target->getContentSize().width, 0));
    }
}


//设置地图位置
void MapLayer::setMapPoint() {
    CCPoint playerPoint = m_spriteLayer->getCurrentPlayerPoint();
    //得到地图将要移动到的位置
    //玩家x位置大于地图参考点时 x = 玩家位置  否则 x = 地图参考点位置
    float mapPositionX = playerPoint.x > REFERENCE_POINT.x ? playerPoint.x : REFERENCE_POINT.x;
    //小于  地图尺寸 - （屏幕尺寸 - 地图参考点时）时  x = 玩家位置   否则 x = 地图尺寸 - （屏幕尺寸 - 地图参考点时）
    mapPositionX = mapPositionX < m_mapSize.width - (SCREEN.width - REFERENCE_POINT.x) ? mapPositionX : m_mapSize.width - (SCREEN.width - REFERENCE_POINT.x);
    
    //由于地图不需要上下移动， 所以这里不对Y进行处理
    
    //目标位置
    CCPoint desPoint = ccp(mapPositionX, 0);
    
    CCPoint rltPoint = ccpSub(REFERENCE_POINT, desPoint);
    this->moveMap(rltPoint);
}





