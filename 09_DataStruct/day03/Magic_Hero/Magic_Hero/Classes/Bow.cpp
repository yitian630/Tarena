//
//  Bow.cpp
//  Magic_Hero
//
//  Created by tarena on 14-6-27.
//
//

#include "Bow.h"
Bow* Bow::createBow(int level) {
    Bow *bow = new Bow();
    if (bow && bow->initBow(level)) {
        bow->autorelease();
        return bow;
    }
    CC_SAFE_DELETE(bow);
    return NULL;
}
bool Bow::initBow(int level) {
    if(!MySprite::init()) return false;
    
    this->bindSprite(CCSprite::createWithSpriteFrameName(CCString::createWithFormat("bow_%d.png", level)->getCString()));
    
    m_level = level;
    return true;
}

//旋转弓
void Bow::bowRotation(float angle) {
    this->getSprite()->setRotation(angle);
}


