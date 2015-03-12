//
//  Enemy2.cpp
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#include "Enemy2.h"
bool Enemy2::init() {
    if (!Role::initRole()) return false;
    
    std::string moveFrame[] = {"enemy2_up%d.png","enemy2_down%d.png","enemy2_left%d.png","enemy2_right%d.png"};
    this->addMoveAnimate(moveFrame, 4);
    //添加将要死亡动画
    this->addWillDieAnimate("enemy2_down1.png");
    
    //设置角色碰撞矩形
    this->setCollisionArea(CCRectMake(-20, 0, 40, 20));
    
    return true;
}







