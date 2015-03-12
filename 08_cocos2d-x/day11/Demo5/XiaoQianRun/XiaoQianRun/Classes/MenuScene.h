//
//  MenuScene.h
//  XiaoQianRun
//
//  Created by BFM on 13-12-8.
//
//

#ifndef __XiaoQianRun__MenuScene__
#define __XiaoQianRun__MenuScene__

#include <iostream>
#include "cocos2d.h"
#include "cocos-ext.h"
USING_NS_CC;
USING_NS_CC_EXT;

class MenuScene : public CCLayer,
public CCBSelectorResolver{
public:
    static CCScene* scene();
    CCB_STATIC_NEW_AUTORELEASE_OBJECT_WITH_INIT_METHOD(MenuScene, create);
    bool init();
private:
    
    virtual SEL_MenuHandler onResolveCCBCCMenuItemSelector(CCObject * pTarget, const char* pSelectorName);
    virtual SEL_CCControlHandler onResolveCCBCCControlSelector(CCObject * pTarget, const char* pSelectorName);
    
    void onStart();

};

#endif /* defined(__XiaoQianRun__MenuScene__) */
