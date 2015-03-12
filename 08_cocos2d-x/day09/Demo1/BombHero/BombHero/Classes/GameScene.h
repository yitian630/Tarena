//
//  GameScene.h
//  BombHero
//
//  Created by tarena on 14-6-13.
//
//

#ifndef __BombHero__GameScene__
#define __BombHero__GameScene__

#include <iostream>
#include "cocos2d.h"
#include "Rocker.h"
USING_NS_CC;

class GameScene : public CCScene{
public:
    static GameScene* createGameScene(int Level);
    bool initGameScene(int Level);
    

};

#endif /* defined(__BombHero__GameScene__) */




