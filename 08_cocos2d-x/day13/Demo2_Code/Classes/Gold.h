//
//  Gold.h
//  XiaoQianRun
//
//  Created by tarena on 14-5-6.
//
//

#ifndef __XiaoQianRun__Gold__
#define __XiaoQianRun__Gold__

#include <iostream>
#include "cocos2d.h"
#include "MySprite.h"
USING_NS_CC;

class Gold : public MySprite {
public:
    static Gold* createGold(CCPoint position);
    bool initGold(CCPoint position);
    
    //得到金币的碰撞区域
    CCRect getCollisionArea();
    
    //金币碰撞后 要隐藏（向上移动，放大，渐变没）
    void goldVanish();
    
    //标识 金币是否已经产生了碰撞
    CC_SYNTHESIZE(bool, isCollision, Collision);
};


#endif /* defined(__XiaoQianRun__Gold__) */





