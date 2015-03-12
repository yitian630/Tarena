//
//  E_lx.cpp
//  XiaoQianRun
//
//  Created by tarena on 14-6-23.
//
//

#include "E_lx.h"
bool E_lx::init() {
    if (!Enemy::initEnemy(6)) return false;
    this->getSprite()->runAction(this->createAnimate("monster/4.png", 8, 3));
    this->startMove();
    return true;
}
