//
//  Cloud.h
//  Plane
//
//  Created by tarena on 14-6-10.
//
//

#ifndef __Plane__Cloud__
#define __Plane__Cloud__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class Cloud : public CCNode {

public:
    CREATE_FUNC(Cloud);
    CC_SYNTHESIZE(float, m_speed, Speed);
    CC_SYNTHESIZE_READONLY(bool, m_isShow, Show);
    virtual bool init();
    void show();
    void hide();
private:
    CCSprite *m_showSprite;
    void update(float time);
};

#endif /* defined(__Plane__Cloud__) */






