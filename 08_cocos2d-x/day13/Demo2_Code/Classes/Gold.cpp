//
//  Gold.cpp
//  XiaoQianRun
//
//  Created by tarena on 14-5-6.
//
//

#include "Gold.h"
Gold* Gold::createGold(CCPoint position) {
    Gold *gold = new Gold();
    if (gold && gold->initGold(position)) {
        gold->autorelease();
        return gold;
    }
    CC_SAFE_DELETE(gold);
    return NULL;
}
bool Gold::initGold(CCPoint position) {
    if(!MySprite::init()) return false;
    
    isCollision = false;
    
    this->setPosition(position);
    
    this->bindSprite(CCSprite::create("ui/gold.png"));
    return true;
}

//得到金币的碰撞区域
CCRect Gold::getCollisionArea(){
    CCRect spriteCollArea = this->getSprite()->boundingBox();
    return CCRectMake(spriteCollArea.getMinX() + this->getPositionX(), spriteCollArea.getMinY() + this->getPositionY(), spriteCollArea.size.width, spriteCollArea.size.height);
}

void Gold::goldVanish() {
    //标识   金币已经产生碰撞
    isCollision = true;
    CCMoveBy *moveBy = CCMoveBy::create(0.5, ccp(0, 150));
    CCFadeTo *fadeTo = CCFadeTo::create(0.5, 0);
    CCScaleTo *scaleTo = CCScaleTo::create(0.5, 1.5);
    CCSpawn *spawn = CCSpawn::create(moveBy, fadeTo, scaleTo, NULL);
    this->getSprite()->runAction(spawn);
}








