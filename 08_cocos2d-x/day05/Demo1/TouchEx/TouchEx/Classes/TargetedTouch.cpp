//
//  TargetedTouch.cpp
//  TouchEx
//
//  Created by tarena on 14-6-12.
//
//

#include "TargetedTouch.h"
void TargetedTouch::onEnter() {
    CCNode::onEnter();
    CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(this, 0, false);
}

void TargetedTouch::onExit(){
    CCNode::onExit();
    CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool TargetedTouch::ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent) {
    CCLog("ccTouchBegan");
    return true;
}
void TargetedTouch::ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent) {
    CCLog("ccTouchMoved");
}
void TargetedTouch::ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent) {
     CCLog("ccTouchEnded");
}





