//
//  Hero.cpp
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#include "Hero.h"
bool Hero::init() {
    if (!Role::initRole()) return false;
    
    //添加移动的动画
    std::string moveFrame[] = {"up%d.png","down%d.png","left%d.png","right%d.png"};
    this->addMoveAnimate(moveFrame, 4);
    //添加站立的动画
    this->addStandAnimate(moveFrame, 1);
    
    return true;
}

//创建一个动画对象
CCAnimate* Hero::createAnimate(const char *spriteFramName, int frameCount){
    CCAnimation *animation = CCAnimation::create();
    for (int i = 0; i < frameCount; i++) {
        int index = 0;
        if(i < 2)
            index = i + 1;
        else if(i == 2)
            index = 1;
        else if(i == 3)
            index = 3;
        CCSpriteFrame *frame = CCSpriteFrameCache::sharedSpriteFrameCache()->spriteFrameByName(CCString::createWithFormat(spriteFramName, index)->getCString());
        animation->addSpriteFrame(frame);
    }
    animation->setDelayPerUnit(0.22);
    animation->setLoops(-1);
    return CCAnimate::create(animation);
}

