//
//  SpriteLayer.h
//  XiaoQianRun
//
//  Created by BFM on 13-12-2.
//
//

#ifndef __XiaoQianRun__SpriteLayer__
#define __XiaoQianRun__SpriteLayer__

#include <iostream>
#include "cocos2d.h"
#include "Player.h"
class MapLayer;
USING_NS_CC;

class SpriteLayer : public CCLayer{
public:
    ~SpriteLayer();
    
    static SpriteLayer* createSpriteLayer(int roleIndex, MapLayer *mapLayer);
    bool initSpriteLayer(int roleIndex, MapLayer *mapLayer);
    CC_SYNTHESIZE(Player*, m_player, Player);
    
    //玩家位置
    CC_PROPERTY_READONLY(CCPoint, currentPlayerPoint, CurrentPlayerPoint);
    
    CC_SYNTHESIZE(MapLayer*, m_mapLayer, MapLayer);
private:
    
    //检测碰撞的更新函数
    void collision_update(float dt);
    
    virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
    
    CCArray *m_golds;
    CCArray *m_enemys;
};

#endif /* defined(__XiaoQianRun__SpriteLayer__) */
