//
//  MenuSceneLoader.h
//  XiaoQianRun
//
//  Created by BFM on 13-12-8.
//
//

#ifndef __XiaoQianRun__MenuSceneLoader__
#define __XiaoQianRun__MenuSceneLoader__

#include <iostream>
#include "cocos2d.h"
#include "cocos-ext.h"
#include "MenuScene.h"
USING_NS_CC;
USING_NS_CC_EXT;


class MenuSceneLoader : public CCLayerLoader{
public:
    CCB_STATIC_NEW_AUTORELEASE_OBJECT_METHOD(MenuSceneLoader, loader);
private:
    CCB_VIRTUAL_NEW_AUTORELEASE_CREATECCNODE_METHOD(MenuScene);
};
#endif /* defined(__XiaoQianRun__MenuSceneLoader__) */
