//
//  GameData.cpp
//  XiaoQianRun
//
//  Created by BFM on 13-12-10.
//
//

#include "GameData.h"
static GameData *gameData = NULL;
GameData* GameData::sharedGameData() {
    if (gameData == NULL) {
        gameData = new GameData();
        gameData->initGameData();
    }
    return gameData;
}

bool GameData::initGameData() {
    m_isBeginner = CCUserDefault::sharedUserDefault()->getBoolForKey("beginner", true);
    if (m_isBeginner) {
        this->setIsBeginner(false);
        this->setMapLevel(1);
        this->setLevel(1);
        this->setMusicVolume(1);
        this->setSoundVolume(1);
        this->flush();
    } else {
        m_mapLevel = CCUserDefault::sharedUserDefault()->getIntegerForKey("map_level");
        m_Level =  CCUserDefault::sharedUserDefault()->getIntegerForKey("level");
        m_musicVolume = CCUserDefault::sharedUserDefault()->getFloatForKey("music");
        m_soundVolume =  CCUserDefault::sharedUserDefault()->getFloatForKey("sound");
    }
    
    return true;
}

void GameData::flush() {
    CCUserDefault::sharedUserDefault()->setBoolForKey("beginner", this->getIsBeginner());
    CCUserDefault::sharedUserDefault()->setIntegerForKey("map_level", this->getMapLevel());
    CCUserDefault::sharedUserDefault()->setIntegerForKey("level", this->getLevel());
    CCUserDefault::sharedUserDefault()->setFloatForKey("music", this->getMusicVolume());
    CCUserDefault::sharedUserDefault()->setFloatForKey("sound", this->getMusicVolume());
    CCUserDefault::sharedUserDefault()->flush();
}





