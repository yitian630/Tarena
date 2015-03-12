//
//  GameScene.h
//  Plane
//
//  Created by tarena on 14-6-10.
//
//

#ifndef __Plane__GameScene__
#define __Plane__GameScene__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class GameScene : public CCScene {
public:
    static GameScene* createGameScene(int level);
    virtual bool initGameScene(int level);

};

#endif /* defined(__Plane__GameScene__) */




