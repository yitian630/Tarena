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
    
    //设置角色碰撞矩形
    this->setCollisionArea(CCRectMake(-20, 0, 40, 20));
    //添加将要死亡动画
    this->addWillDieAnimate("enemy1_down1.png");
    
    return true;
}







