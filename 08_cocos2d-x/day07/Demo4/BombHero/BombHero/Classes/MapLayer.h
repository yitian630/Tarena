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
    
    void moveMap(CCPoint movePoint);
};

#endif /* defined(__BombHero__MapLayer__) */





