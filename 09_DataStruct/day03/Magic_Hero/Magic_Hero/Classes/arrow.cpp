//
//  arrow.cpp
//  Magic_Hero
//
//  Created by tarena on 14-6-27.
//
//
#define SPEED 900
#include "arrow.h"
Arrow* Arrow::creatArrow(int level, CCPoint position,CCPoint touchPosition) {
    Arrow *arrow = new Arrow();
    if (arrow && arrow->initArrow(level, position, touchPosition)) {
        arrow->autorelease();
        return arrow;
    }
    CC_SAFE_DELETE(arrow);
    return NULL;
}
bool Arrow::initArrow(int level, CCPoint position,CCPoint touchPosition) {
    if(!MySprite::init()) return false;
    
    this->setPosition(position);
    
    this->bindSprite(CCSprite::createWithSpriteFrameName(CCString::createWithFormat("arrow_%d.png", level)->getCString()));
    
    this->getSprite()->setRotation(CC_RADIANS_TO_DEGREES(ccpAngleSigned(this->convertToNodeSpace(touchPosition), ccp(1, 0))));
    
    CCPoint nor = ccpNormalize(ccpSub(touchPosition, this->getPosition()));

    this->runAction(CCMoveBy::create(1, ccpMult(nor, SPEED)));
    
    
    return true;
}




