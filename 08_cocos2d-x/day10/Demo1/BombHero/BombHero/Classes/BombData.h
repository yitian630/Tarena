//
//  BombData.h
//  BombHero
//
//  Created by tarena on 14-6-19.
//
//

#ifndef __BombHero__BombData__
#define __BombHero__BombData__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class BombData : public CCObject {
public:
    static BombData *shardBombHeroData();
    bool initBombHeroData();
    
    CC_SYNTHESIZE(int, m_level, Levle);
    CC_SYNTHESIZE(bool, m_isBeginner, IsBeginner);
    
    //写入数据
    void flush();
};

#endif /* defined(__BombHero__BombData__) */
