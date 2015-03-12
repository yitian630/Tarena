//
//  GameScene.h
//  Loading
//
//  Created by tarena on 14-6-25.
//
//

#ifndef __Loading__GameScene__
#define __Loading__GameScene__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class GameScene : public CCLayer {
public:
    static CCScene* scene();
    CREATE_FUNC(GameScene);
    bool init();
};

#endif /* defined(__Loading__GameScene__) */




