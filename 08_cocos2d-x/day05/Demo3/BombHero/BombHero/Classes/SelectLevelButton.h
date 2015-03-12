//
//  SelectLevelButton.h
//  BombHero
//
//  Created by tarena on 14-6-12.
//
//

#ifndef __BombHero__SelectLevelButton__
#define __BombHero__SelectLevelButton__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class SelectLevelButton : public CCNode , public CCTargetedTouchDelegate{
public:
    static SelectLevelButton* createButton(int Level);
    bool initButton(int Level);
    
    void onEnter();
    void onExit();
    //解锁
    void openLock();
private:
    CCSprite *m_showSprite;
    int m_level;
    
    virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);
    
    //判断 点 是否在 背景精灵上
    bool isTouchInside(CCTouch *pTouch);
    

    
    bool m_isUnLock;

};



#endif /* defined(__BombHero__SelectLevelButton__) */






