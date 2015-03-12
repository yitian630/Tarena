//
//  Plane.h
//  Plane
//
//  Created by tarena on 14-6-11.
//
//

#ifndef __Plane__Plane__
#define __Plane__Plane__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;
class Plane : public CCNode{
public:
    static Plane* creatPlane(CCPoint position);
    bool initPlane(CCPoint position);
private:
    CCSprite *m_showSprite;
    //生命
    //level
    //速度
};
#endif /* defined(__Plane__Plane__) */






