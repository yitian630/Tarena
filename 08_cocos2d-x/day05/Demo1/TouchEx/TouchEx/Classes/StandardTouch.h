//
//  StandardTouch.h
//  TouchEx
//
//  Created by tarena on 14-6-12.
//
//

#ifndef __TouchEx__StandardTouch__
#define __TouchEx__StandardTouch__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class StandardTouch : public CCNode, public CCStandardTouchDelegate {
public:
    CREATE_FUNC(StandardTouch);
    void onEnter();
    void onExit();
private:
    // optional
    virtual void ccTouchesBegan(CCSet *pTouches, CCEvent *pEvent);
    virtual void ccTouchesMoved(CCSet *pTouches, CCEvent *pEvent);
    virtual void ccTouchesEnded(CCSet *pTouches, CCEvent *pEvent);
};


#endif /* defined(__TouchEx__StandardTouch__) */






