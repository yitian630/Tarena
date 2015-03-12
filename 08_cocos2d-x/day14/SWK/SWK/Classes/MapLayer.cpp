//
//  MapLayer.cpp
//  SWK
//
//  Created by tarena on 14-6-24.
//
//

#include "MapLayer.h"
#include "RockerButton.h"
#include "Defines.h"
CCScene* MapLayer::scene() {
    CCScene *scene = CCScene::create();
    MapLayer *mapLayer = MapLayer::create();
    scene->addChild(mapLayer);
    
    CCLayer *rockerLayer = CCLayer::create();
    scene->addChild(rockerLayer);
    //攻击按钮
    RockerButton *attackBut = RockerButton::creatButton("rocker.png", ccp(800, 100), mapLayer, function_selector(MapLayer::attack));
    rockerLayer->addChild(attackBut);
    attackBut->startButton();
    //特效按钮
    RockerButton *effectBut = RockerButton::creatButton("rocker.png", ccp(800, 200), mapLayer, function_selector(MapLayer::effect));
    rockerLayer->addChild(effectBut);
    effectBut->startButton();
    
    //摇杆
    Rocker *rocker = Rocker::createRocker("rocker.png", "rockerBG.png", ccp(200, 100));
    rockerLayer->addChild(rocker);
    rocker->startRocker();
    rocker->setDelegate_Custom(mapLayer);
//    rocker->setDelegate(mapLayer);
    
    return scene;
}


bool MapLayer::init() {
    if(!CCLayer::create()) return false;
    SimpleAudioEngine::sharedEngine()->playBackgroundMusic("TheDawn.mp3");
    SimpleAudioEngine::sharedEngine()->setBackgroundMusicVolume(0.5);
    
    //背景图片
    CCSprite *bg = CCSprite::create("map1_1.png");
    this->addChild(bg);
    bg->setAnchorPoint(ccp(0, 1));
    bg->setPosition(ccp(0, SCREEN.height));
    
    
    m_map = CCSprite::create("map1_2.png");
    this->addChild(m_map);
    m_map->setAnchorPoint(CCPointZero);

    m_fg = CCSprite::create("map1_3.png");
    this->addChild(m_fg, 1);
    m_fg->setAnchorPoint(CCPointZero);
    m_mapSize = CCSizeMake(m_fg->getContentSize().width, 640);
    
    //孙悟空—精灵
    m_swk = SunWuKong::createSWK();
    this->addChild(m_swk);
    m_swk->setPosition(ccp(100, 200));
    
    this->scheduleUpdate();

    return true;
}
void MapLayer::attack(){
    m_swk->attack();
}
void MapLayer::effect() {
    m_swk->effect();
}

void MapLayer::touchBegan_cus(CCObject *rocker, CCPoint normalizer){
    m_swk->walk(normalizer);
}
void MapLayer::touchMove_cus(CCObject *rocker, CCPoint normalizer) {
    m_swk->walk(normalizer);
}
void MapLayer::touchEnd_cus(CCObject *rocker) {
    m_swk->idle();
}

void MapLayer::touchBegan_de(CCObject *rocker, RockerDirection dir) {
    CCLog("孙武空 四方向 Began");
}
void MapLayer::touchMove_de(CCObject *rocker, RockerDirection dir) {
    CCLog("孙武空 四方向 Move");

}
void MapLayer::touchEnd_de(CCObject *rocker, RockerDirection dir) {
    CCLog("孙武空 四方向 End");

}

void MapLayer::update(float time) {
    this->setMapPoint();
}


//设置地图位置
void MapLayer::setMapPoint() {
    CCPoint playerPoint = m_swk->getPosition();
    //得到地图将要移动到的位置
    //玩家x位置大于地图参考点时 x = 玩家位置  否则 x = 地图参考点位置
    float mapPositionX = playerPoint.x > REFERENCE_POINT.x ? playerPoint.x : REFERENCE_POINT.x;
    //小于  地图尺寸 - （屏幕尺寸 - 地图参考点时）时  x = 玩家位置   否则 x = 地图尺寸 - （屏幕尺寸 - 地图参考点时）
    mapPositionX = mapPositionX < m_mapSize.width - (SCREEN.width - REFERENCE_POINT.x) ? mapPositionX : m_mapSize.width - (SCREEN.width - REFERENCE_POINT.x);
    
    //由于地图不需要上下移动， 所以这里不对Y进行处理
    float mapPositionY = playerPoint.y > REFERENCE_POINT.y ? playerPoint.y : REFERENCE_POINT.y;
    //小于  地图尺寸 - （屏幕尺寸 - 地图参考点时）时  y = 玩家位置   否则 y = 地图尺寸 - （屏幕尺寸 - 地图参考点时）
    mapPositionY = mapPositionY < m_mapSize.height - (SCREEN.height - REFERENCE_POINT.y) ? mapPositionY : m_mapSize.height - (SCREEN.height - REFERENCE_POINT.y);
    
    
    
    //目标位置
    CCPoint desPoint = ccp(mapPositionX, mapPositionY);
    
    CCPoint rltPoint = ccpSub(REFERENCE_POINT, desPoint);
    this->setPosition(rltPoint);
}
