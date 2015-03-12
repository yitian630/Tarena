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
 private:
    
    bool initMapLayer(int mapLevel, int Level);
    
    
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
    
    //地图图块上一次所在的位置
    CCPoint m_mapPoint_before;

    //移动地图
    void moveMap(CCPoint toPoint);
    
    //地图的更新方法
    void moveMapUpdate(float dt);
private:
    int tempX;
};

#endif /* defined(__XiaoQianRun__MapLayer__) */
