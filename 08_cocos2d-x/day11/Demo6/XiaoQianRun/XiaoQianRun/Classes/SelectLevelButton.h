//
//  SelectLevelButton.h
//  XiaoQianRun
//
//  Created by BFM on 13-12-9.
//
//

#ifndef __XiaoQianRun__SelectLevelButton__
#define __XiaoQianRun__SelectLevelButton__

#include <iostream>
#include "OnClickNode.h"
#include "cocos2d.h"
USING_NS_CC;

typedef enum {
    LOCK,
    UNLOCK,
    FINISH
}Button_State;

//每关得分等级
typedef enum {
    S,
    A,
    B,
    C,
    D
}Grade;

class SelectLevelButton : public OnClickNode {
public:
    static SelectLevelButton* createSelectLevelButton(int mapLevel, int Level);
    bool initSelectLevelButton(int mapLevel, int Level);
    
    virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);
    //按钮的状态
    CC_SYNTHESIZE(Button_State, m_button_State, Button_State);
    //小地图等级
    CC_SYNTHESIZE(int, m_level, Level);
    //大关等级
    CC_SYNTHESIZE(int, m_mapLevel, MapLevel);
    
    //解锁
    void unLock();
    //完成   (完成需要  当前关卡的完成度)
    void finish(Grade grade);
    
private:
    CCSprite *lockSprite;
    //选关框的背景
    CCSprite *m_bg;

};

#endif /* defined(__XiaoQianRun__SelectLevelButton__) */
