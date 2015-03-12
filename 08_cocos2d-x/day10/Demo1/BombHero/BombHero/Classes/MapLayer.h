//
//  MapLayer.h
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#ifndef __BombHero__MapLayer__
#define __BombHero__MapLayer__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class MapLayer : public CCLayer {
public:
    static MapLayer* createMapLayer(int Level);
    bool initMapLayer(int Level);
    
    CC_SYNTHESIZE_READONLY(CCSize, m_mapSize, MapSize);
    
    CC_SYNTHESIZE_READONLY(CCArray*, m_objectArr, ObjectArr)
    
    void moveMap(CCPoint movePoint);
    
    CCTMXLayer *m_collisionLayer;
    
    //判断一个点 是否在一个碰撞的图块内
    bool isTileCollision(CCPoint position);
    
    //把位置 转换 为行列
    CCPoint tileCoordForPosition(CCPoint position);
    
    //把行列 转换 位置
    CCPoint positionForTileCoord(CCPoint tileCoord);
    
    void GameWin();
    void GameLose();
    void stopRocker();
private:
    CCTMXTiledMap *m_tileMap;
};

#endif /* defined(__BombHero__MapLayer__) */





