//
//  MapLayer.h
//  SWK
//
//  Created by tarena on 14-6-24.
//
//

#ifndef __SWK__MapLayer__
#define __SWK__MapLayer__

#include <iostream>
#include "cocos2d.h"
#include "SunWuKong.h"
#include "Rocker.h"
#include "SimpleAudioEngine.h"
using namespace CocosDenshion;
USING_NS_CC;

class MapLayer : public CCLayer, public RockerDelegate_Custom, public RockerDelegate{
public:
    static CCScene* scene();
    CREATE_FUNC(MapLayer);
    bool init();
    
    CCSprite *m_map;
    CCSprite *m_fg;
private:
    SunWuKong *m_swk;
    
    void attack();
    void effect();
    
    //任意方向移动
    void touchBegan_cus(CCObject *rocker, CCPoint normalizer);
    void touchMove_cus(CCObject *rocker, CCPoint normalizer);
    void touchEnd_cus(CCObject *rocker);
    
    virtual void touchBegan_de(CCObject *rocker, RockerDirection dir);
    virtual void touchMove_de(CCObject *rocker, RockerDirection dir);
    virtual void touchEnd_de(CCObject *rocker, RockerDirection dir);
    void setMapPoint();
    void update(float timd);
    CCSize m_mapSize;
};

#endif /* defined(__SWK__MapLayer__) */






