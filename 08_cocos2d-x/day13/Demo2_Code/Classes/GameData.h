//
//  GameData.h
//  XiaoQianRun
//
//  Created by BFM on 13-12-10.
//
//

#ifndef __XiaoQianRun__GameData__
#define __XiaoQianRun__GameData__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class GameData : public CCObject {
public:
    static GameData* sharedGameData();
    //大地图等级
    CC_SYNTHESIZE(int, m_mapLevel, MapLevel);
    //每个大地图中的小地图等级
    CC_SYNTHESIZE(int, m_Level, Level);
    CC_SYNTHESIZE(bool, m_isBeginner, IsBeginner);
    CC_SYNTHESIZE(float, m_soundVolume, SoundVolume);
    CC_SYNTHESIZE(float, m_musicVolume, MusicVolume);
    
    void flush();
    
private:
    bool initGameData();
};

#endif /* defined(__XiaoQianRun__GameData__) */
