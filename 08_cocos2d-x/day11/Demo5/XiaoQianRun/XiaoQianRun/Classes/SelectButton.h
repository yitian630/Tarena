//
//  SelectButton.h
//  XiaoQianRun
//
//  Created by ZX on 13-12-9.
//
//

#ifndef __XiaoQianRun__SelectButton__
#define __XiaoQianRun__SelectButton__

#include <iostream>
#include "OnClickNode.h"
#include "cocos2d.h"
USING_NS_CC;

class SelectButton : public OnClickNode {
public:
    static SelectButton* createSelectButton(int mapLevel, int Level, int roleIndex);
    bool initSelectButton(int mapLevel, int Level, int roleIndex);
    
    virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);
    
private:

    CCSprite *m_role;
    
    //选中后的背景光圈
    CCSprite* m_role_light;
    
    int m_roleIndex;
    int m_mapLevel;
    int m_Level;

};


#endif /* defined(__XiaoQianRun__SelectButton__) */











