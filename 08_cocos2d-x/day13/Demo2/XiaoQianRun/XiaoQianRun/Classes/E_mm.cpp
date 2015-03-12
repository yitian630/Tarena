//
//  E_mm.cpp
//  XiaoQianRun
//
//  Created by tarena on 14-6-23.
//
//

#include "E_mm.h"
bool E_mm::init() {
    if (!Enemy::initEnemy(3)) return false;
    this->getSprite()->runAction(this->createAnimate("monster/1.png", 4, 1));
    this->startMove();
    return true;
}




