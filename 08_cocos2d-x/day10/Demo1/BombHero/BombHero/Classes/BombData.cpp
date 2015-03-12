//
//  BombData.cpp
//  BombHero
//
//  Created by tarena on 14-6-19.
//
//

#include "BombData.h"

#define LEVEL "level"
static BombData *bombData = NULL;
BombData* BombData::shardBombHeroData() {
    if (!bombData) {
        bombData = new BombData();
        bombData->initBombHeroData();
    }
    return bombData;
}

bool BombData::initBombHeroData() {
    //判断是否是第一次进入游戏
    m_isBeginner = CCUserDefault::sharedUserDefault()->getBoolForKey("Beginner", true);
    if (m_isBeginner) {
        m_level = 1;
        m_isBeginner = false;
        //要讲属性 写入 UserDefault
        this->flush();
    } else {
        m_level = CCUserDefault::sharedUserDefault()->getIntegerForKey(LEVEL);
    }
    
    return true;
}

//写入数据
void BombData::flush() {
    CCUserDefault::sharedUserDefault()->setIntegerForKey(LEVEL, m_level);
    CCUserDefault::sharedUserDefault()->setBoolForKey("Beginner", m_isBeginner);
    //把数据 写到 外部文件中 保存起来
    CCUserDefault::sharedUserDefault()->flush();
}


