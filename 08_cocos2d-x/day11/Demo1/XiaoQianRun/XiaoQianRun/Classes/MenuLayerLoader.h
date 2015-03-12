//
//  MenuLayerLoader.h
//  XiaoQianRun
//
//  Created by tarena on 14-6-19.
//
//

#ifndef __XiaoQianRun__MenuLayerLoader__
#define __XiaoQianRun__MenuLayerLoader__

#include <iostream>
#include "MenuLayer.h"
#include "cocos2d.h"
#include "cocos-ext.h"
USING_NS_CC;
USING_NS_CC_EXT;

class MenuLayerLoader : public CCLayerLoader {
public:
    CCB_STATIC_NEW_AUTORELEASE_OBJECT_METHOD(MenuLayerLoader, loader);
private:
    
 CCB_VIRTUAL_NEW_AUTORELEASE_CREATECCNODE_METHOD(MenuLayer);
};

#endif /* defined(__XiaoQianRun__MenuLayerLoader__) */






