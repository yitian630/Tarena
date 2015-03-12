//
//  MapLayer.h
//  Plane
//
//  Created by tarena on 14-6-10.
//
//

#ifndef __Plane__MapLayer__
#define __Plane__MapLayer__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class MapLayer : public CCLayer {
public:
    static MapLayer* createMapLayer(int level);
    bool initMapLayer(int level);
    
private:
    void update(float time);
    CCSprite *m_bg1;
    CCSprite *m_bg2;
};

#endif /* defined(__Plane__MapLayer__) */





