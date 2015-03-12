//
//  MapLayer.cpp
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#include "MapLayer.h"
#include "Defines.h"
#include "GameScene.h"
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
    
    m_tileMap = CCTMXTiledMap::create("Map/myMap.tmx");
    this->addChild(m_tileMap);
    //getMapSize() 得到 地图 宽有多少块  高有多少块
    //getTileSize() 得到 每个图块的宽高
    m_mapSize = CCSizeMake(m_tileMap->getTileSize().width * m_tileMap->getMapSize().width, m_tileMap->getTileSize().height * m_tileMap->getMapSize().height);
    
    //地图层去移动
    this->setPositionY(SCREEN.height - m_mapSize.height);
    
    //得到 对象组
    CCTMXObjectGroup *group = m_tileMap->objectGroupNamed("objects");

    m_objectArr = group->getObjects();  // 1
    //这里不用 retain
//    CC_SAFE_RETAIN(m_objectArr);
    
    //得到碰撞层对象
    m_collisionLayer = m_tileMap->layerNamed("collision_layer");
    m_collisionLayer->setVisible(false);
    
    
    CCLog("isCollisont = %d", this->isTileCollision(ccp(70,1130)));

    return true;
}


void MapLayer::moveMap(CCPoint movePoint) {
    this->setPosition(ccpAdd(this->getPosition(), movePoint));
}

//判断一个点 是否在一个碰撞的图块内
bool MapLayer::isTileCollision(CCPoint position) {
    //把 位置 转换成 行列
    CCPoint tileCoord = this->tileCoordForPosition(position);
    int tileGid = m_collisionLayer->tileGIDAt(tileCoord);
    //Gid 等于 0 说明 当前层当前行列的位置没有图块
    if (tileGid) {
        //取出 Gid 对应图块的属性
        CCDictionary *dic = m_tileMap->propertiesForGID(tileGid);
        const CCString *isCollision = dic->valueForKey("isCollision");
        if (isCollision && isCollision->compare("true") == 0) {
            return true;
        }
    }
    return false;
}


//把位置 转换 为行列
CCPoint MapLayer:: tileCoordForPosition(CCPoint position) {
    int coordX = position.x / 60;
    int coordY = (m_mapSize.height - position.y) / 60;
    return ccp(coordX, coordY);
}

//把行列 转换 位置
CCPoint MapLayer::positionForTileCoord(CCPoint tileCoord) {
    float posX = tileCoord.x * 60;
    float posY = m_mapSize.height - tileCoord.y * 60;
    return ccp(posX, posY);
}

void MapLayer::GameWin() {
    ((GameScene*)this->getParent())->GameWin();
}
void MapLayer::GameLose() {
     ((GameScene*)this->getParent())->GameLose();
}
void MapLayer::stopRocker() {
    ((GameScene*)this->getParent())->stopRocker();
}
