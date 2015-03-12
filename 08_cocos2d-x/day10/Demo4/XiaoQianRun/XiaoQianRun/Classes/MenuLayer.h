//
//  MenuLayer.h
//  XiaoQianRun
//
//  Created by tarena on 14-6-19.
//
//

#ifndef __XiaoQianRun__MenuLayer__
#define __XiaoQianRun__MenuLayer__

#include <iostream>
#include "cocos2d.h"
#include "cocos-ext.h"
USING_NS_CC;
USING_NS_CC_EXT;

class MenuLayer : public CCLayer {
public:
    static CCScene *scene();
    CCB_STATIC_NEW_AUTORELEASE_OBJECT_WITH_INIT_METHOD(MenuLayer, create);
    
    bool init();    
};

#endif /* defined(__XiaoQianRun__MenuLayer__) */






