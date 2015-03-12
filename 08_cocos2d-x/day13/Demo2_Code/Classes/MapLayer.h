//
//  MapLayer.h
//  XiaoQianRun
//
//  Created by apple_developer on 13-11-29.
//
//

#ifndef __XiaoQianRun__MapLayer__
#define __XiaoQianRun__MapLayer__

#include <iostream>
#include "cocos2d.h"
#include "SpriteLayer.h"
#include "Defines.h"
USING_NS_CC;

class MapLayer : public CCLayer {
public:
    ~MapLayer();
    static CCScene* scene(int mapLevel, int Level, int roleIndex);
    CREATE_FUNC(MapLayer);

    CC_SYNTHESIZE(int, m_mapLevel, MapLevel);
    CC_SYNTHESIZE(int, m_Level, Level);
    CC_SYNTHESIZE(int, m_roleIndex, RoleIndex);
    CC_SYNTHESIZE(CCSize, m_mapSize, MapSiae);
    
    //碰撞对象数组
    CC_SYNTHESIZE(CCArray*, collisionObjects, CollisionObjects);
    
    //金币对象数组
    CC_SYNTHESIZE(CCArray*, goldObjects, GoldObjects);
    
    //金币对象数组
    CC_SYNTHESIZE(CCArray*, enemyObjects, EnemyObjects);


private:
    
    bool initMapLayer(int mapLevel, int Level, int roleIndex);
    
    //远景背景1
    CCSprite *_distanceBg1;
    //远景背景2
    CCSprite *_distanceBg2;
    //近景背景1
    CCSprite *_vicinityBg1;
    //近景背景1
    CCSprite *_vicinityBg2;
    //初始化背景图片
    void initBackGround();
    //背景图片如果移除屏幕放在屏幕后等待滚动
    void moveMapOfBackGround(CCSprite *move, CCSprite *target);
    
    //前景地图   通过解析地图文件获取的对象
    CCTMXTiledMap* m_tiledMap;
    //初始化瓦块地图相关
    void initTiledMap();
    

    
    //地图图块上一次所在的位置
    CCPoint m_mapPoint_before;

    //移动地图块地图
    void moveMap(CCPoint toPoint);
    //地图的更新方法
    void moveMapUpdate(float dt);
    
    //精灵层对象
    SpriteLayer *m_spriteLayer;
    
    //设置地图位置 
    void setMapPoint();
    


private:
    int tempX;
};

#endif /* defined(__XiaoQianRun__MapLayer__) */
