//
//  TargetedTouch.h
//  TouchEx
//
//  Created by tarena on 14-6-12.
//
//

#ifndef __TouchEx__TargetedTouch__
#define __TouchEx__TargetedTouch__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class TargetedTouch : public CCNode , public CCTargetedTouchDelegate{
public:
    CREATE_FUNC(TargetedTouch);
    void onEnter();
    virtual void onExit();
private:
    virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);
};

#endif /* defined(__TouchEx__TargetedTouch__) */








