//
//  SunWuKong.h
//  SWK
//
//  Created by tarena on 14-6-24.
//
//

#ifndef __SWK__SunWuKong__
#define __SWK__SunWuKong__

#include <iostream>
#include "cocos2d.h"
#include "cocos-ext.h"
USING_NS_CC;
USING_NS_CC_EXT;

#define speed 8

typedef enum {
    WALK,
    IDLE,
    ATTACK,
    EFFECT
}SWK_state;

class SunWuKong : public CCNode, public CCBSelectorResolver{
public:
    CCB_STATIC_NEW_AUTORELEASE_OBJECT_WITH_INIT_METHOD(SunWuKong, create);
    
    static SunWuKong* createSWK();
    bool initSunWuKong(CCBReader *bReader);
    
    void idle();
    void walk(CCPoint normalizer);
    void attack();
    void effect();
    
private:
    SWK_state m_swkState;
    CCBAnimationManager *m_manager;
    
    void update(float time);

    CCPoint m_normalizer;
    
    
    virtual SEL_MenuHandler onResolveCCBCCMenuItemSelector(CCObject * pTarget, const char* pSelectorName);
    virtual SEL_CallFuncN onResolveCCBCCCallFuncSelector(CCObject * pTarget, const char* pSelectorName);
    virtual SEL_CCControlHandler onResolveCCBCCControlSelector(CCObject * pTarget, const char* pSelectorName);
    
    void ZhenDong();
};

#endif /* defined(__SWK__SunWuKong__) */






