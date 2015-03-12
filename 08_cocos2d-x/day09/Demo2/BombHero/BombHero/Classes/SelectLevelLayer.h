//
//  SelectLevelLayer.h
//  BombHero
//
//  Created by tarena on 14-6-12.
//
//

#ifndef __BombHero__SelectLevelLayer__
#define __BombHero__SelectLevelLayer__

#include <iostream>
#include <iostream>
#include "cocos2d.h"
USING_NS_CC;
class SelectLevelLayer : public CCLayer {
public:
    static CCScene* scene();
    CREATE_FUNC(SelectLevelLayer);
    bool init();
    
    void goMenu();
 
};

#endif /* defined(__BombHero__SelectLevelLayer__) */
