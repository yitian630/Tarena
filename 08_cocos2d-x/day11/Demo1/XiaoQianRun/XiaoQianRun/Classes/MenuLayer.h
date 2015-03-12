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

class MenuLayer : public CCLayer , public CCBSelectorResolver{
public:
    static CCScene *scene();
    CCB_STATIC_NEW_AUTORELEASE_OBJECT_WITH_INIT_METHOD(MenuLayer, create);
    
    bool init();
    
    
    virtual SEL_MenuHandler onResolveCCBCCMenuItemSelector(CCObject * pTarget, const char* pSelectorName);
    virtual SEL_CCControlHandler onResolveCCBCCControlSelector(CCObject * pTarget, const char* pSelectorName);
    
    void onStartGame();
};

#endif /* defined(__XiaoQianRun__MenuLayer__) */






