//
//  Bow.h
//  Magic_Hero
//
//  Created by tarena on 14-6-27.
//
//

#ifndef __Magic_Hero__Bow__
#define __Magic_Hero__Bow__

#include <iostream>
#include "cocos2d.h"
#include "MySprite.h"
USING_NS_CC;

class Bow : public MySprite {
public:
    static Bow* createBow(int level);
    bool initBow(int level);
    void bowRotation(float angle);
    CC_SYNTHESIZE_READONLY(int, m_level, Level);
};

#endif /* defined(__Magic_Hero__Bow__) */



