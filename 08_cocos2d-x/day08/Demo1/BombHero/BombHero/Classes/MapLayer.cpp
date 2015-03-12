//
//  MapLayer.cpp
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#include "MapLayer.h"
#include "Defines.h"
MapLayer* MapLayer::createMapLayer(int Level) {
    MapLayer *mapLayer = new MapLayer();
    if (mapLayer && mapLayer->initMapLayer(Level)) {
        mapLayer->autorelease();
        return mapLayer;
    }
    CC_SAFE_DELETE(mapLayer);
    return NULL;
}
bool MapLayer::initMapLayer(int Level) {
    if (!CCLayer::init()) return false;
    
    CCTMXTiledMap *tileMap = CCTMXTiledMap::create("Map/myMap.tmx");
    this->addChild(tileMap);
    //getMapSize() 得到 地图 宽有多少块  高有多少块
    //getTileSize() 得到 每个图块的宽高
    m_mapSize = CCSizeMake(tileMap->getTileSize().width * tileMap->getMapSize().width, tileMap->getTileSize().height * tileMap->getMapSize().height);
    
    //地图层去移动
    this->setPositionY(SCREEN.height - m_mapSize.height);
    
    //得到 对象组
    CCTMXObjectGroup *group = tileMap->objectGroupNamed("objects");

    m_objectArr = group->getObjects();  // 1
    //这里不用 retain
//    CC_SAFE_RETAIN(m_objectArr);
    
    
    return true;
}


void MapLayer::moveMap(CCPoint movePoint) {
    this->setPosition(ccpAdd(this->getPosition(), movePoint));
}





