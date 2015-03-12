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
    //初始化地图层
    mapLayer->initMapLayer(mapLevel, Level);
    
    scene->addChild(mapLayer);
    return scene;
}


bool MapLayer::initMapLayer(int mapLevel, int Level) {
    if (!CCLayer::init()) return false;
    
    SimpleAudioEngine::sharedEngine()->playBackgroundMusic("music/game.mp3", true);
    
    m_mapLevel = mapLevel;
    m_Level = Level;
    
    m_mapPoint_before = CCPointZero;

    
    //初始化背景地图
    this->initBackGround();


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



//移动地图
void MapLayer::moveMap(CCPoint toPoint){
    
    //计算层移动的距离
    CCPoint distance = ccpSub(toPoint, m_mapPoint_before);
    m_mapPoint_before = toPoint;
    
    //远景背景移动
    _distanceBg1->setPosition(ccpAdd(_distanceBg1->getPosition(), ccp(distance.x / 5.0, 0)));
    _distanceBg2->setPosition(ccpAdd(_distanceBg2->getPosition(), ccp(distance.x / 5.0, 0)));
    this->moveMapOfBackGround( _distanceBg1, _distanceBg2);
    this->moveMapOfBackGround( _distanceBg2, _distanceBg1);
    
    if(_vicinityBg1 && _vicinityBg2) {
        //近景背景移动
        _vicinityBg1->setPosition(ccpAdd(_vicinityBg1->getPosition(), ccp(distance.x / 2.0, 0)));
        _vicinityBg2->setPosition(ccpAdd(_vicinityBg2->getPosition(), ccp(distance.x / 2.0, 0)));
        
        this->moveMapOfBackGround( _vicinityBg1, _vicinityBg2);
        this->moveMapOfBackGround( _vicinityBg2, _vicinityBg1);
    }

  
}

//地图的更新方法
void MapLayer::moveMapUpdate(float dt) {
    //临时
    this->moveMap(ccpAdd(m_mapPoint_before, ccp(-3, 0)));
}

//背景地图如果移除屏幕放在屏幕后等待滚动
void MapLayer::moveMapOfBackGround(CCSprite *move, CCSprite *target){
    if (move->getPositionX() <= -move->getContentSize().width) {
        move->setPosition(ccp(target->getPositionX() + target->getContentSize().width, 0));
    }
}






