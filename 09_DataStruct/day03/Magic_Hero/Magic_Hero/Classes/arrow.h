//
//  arrow.h
//  Magic_Hero
//
//  Created by tarena on 14-6-27.
//
//

#ifndef __Magic_Hero__arrow__
#define __Magic_Hero__arrow__

#include <iostream>
#include "cocos2d.h"
#include "MySprite.h"
USING_NS_CC;

class Arrow : public MySprite {
public:
    static Arrow* creatArrow(int level, CCPoint position, CCPoint touchPosition);
    bool initArrow(int level, CCPoint position,CCPoint touchPosition);
};

#endif /* defined(__Magic_Hero__arrow__) */





