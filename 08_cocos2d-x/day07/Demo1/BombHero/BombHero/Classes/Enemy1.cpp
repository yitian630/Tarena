//
//  Enemy1.cpp
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#include "Enemy1.h"
bool Enemy1::init() {
    if (!Role::initRole()) return false;
    
    std::string moveFrame[] = {"enemy1_up%d.png","enemy1_down%d.png","enemy1_left%d.png","enemy1_right%d.png"};
    this->addMoveAnimate(moveFrame, 4);
    
    return true;
}







