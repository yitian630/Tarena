//
//  MenuLayer.h
//  BombHero
//
//  Created by tarena on 14-6-12.
//
//

#ifndef __BombHero__MenuLayer__
#define __BombHero__MenuLayer__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class MenuLayer : public CCLayer {
public:
    ~MenuLayer();
    static CCScene* scene();
    CREATE_FUNC(MenuLayer);
    bool init();
    
    void goSelectLevelScene();
    
    void musicToggle();
};


#endif /* defined(__BombHero__MenuLayer__) */







