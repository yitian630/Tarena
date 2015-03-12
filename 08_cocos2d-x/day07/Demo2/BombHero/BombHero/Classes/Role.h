//
//  Role.h
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#ifndef __BombHero__Role__
#define __BombHero__Role__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

typedef enum{
    Role_Stand,
    Role_Move,
    Role_WillDie,
    Role_Die
}Action_State;

typedef enum{
    Role_UP,
    Role_Down,
    Role_Left,
    Role_Right,
    Role_Count
}Role_Dir;


class Role : public CCNode {
public:
    ~Role();
    bool initRole();
    //角色状态
    CC_SYNTHESIZE(Action_State, m_rolestate, RoleState);
    //角色方向
    CC_SYNTHESIZE(Role_Dir, m_roleDir, ROleDir);
    CC_SYNTHESIZE(float, m_speed, Speed);
    
    //创建移动动画
    void addMoveAnimate(std::string* frameNames, int frameCount);
    //创建站立动画
    void addStandAnimate(std::string* frameNames, int frameCount);
    //创建将要死亡动画
    void addWillDieAnimate(std::string frameName);
    
    
    //运行移动动画
    void runRole_MoveAnimation(Role_Dir changeDir);
    //运行站立的动画
    void runRole_StandAnimation();
    //运行将要死亡的动画
    void runRole_WillDie();
    
    //角色移动
    CCPoint roleMove();
private:
    
    CCSprite *m_showSprite;
    //保存 游戏动画  (状态 + 方向)
    CCDictionary *m_dictionary;
    //向字典中添加 动画对象
    void addAnimate(CCAnimate *animate, Action_State state, Role_Dir dir);
    //向字典中取动画
    CCAnimate* getAnimate( Action_State state, Role_Dir dir);
    

    //创建一个动画对象
   virtual CCAnimate* createAnimate(const char *spriteFramName, int frameCount);


  
};





#endif /* defined(__BombHero__Role__) */





