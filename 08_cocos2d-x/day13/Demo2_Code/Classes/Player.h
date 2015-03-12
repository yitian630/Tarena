//
//  Player.h
//  XiaoQianRun
//
//  Created by BFM on 13-12-2.
//
//

#ifndef __XiaoQianRun__Player__
#define __XiaoQianRun__Player__

#include <iostream>
#include "cocos2d.h"
#include "MySprite.h"
USING_NS_CC;

#define ConstX_Speed 10
#define ConstY_Speed 20
#define Acceslate 0.95

typedef enum {
    START,  //开始
    MOVE,   //移动
    JUMP_UP, //跳起上升
    JUMP_DOWN, //下降
    WILL_DIE, //将要死亡
    GAME_WIN, //将要死亡
}PlayerState;

//角色名称
enum {
    NingCaiCheng = 1,
    NieXiaoQian,
    NieXiaoQian_MeiMei,
    YanChiXia
};

//碰撞方向
enum COLLISION_DIRECTION{
    COLLISION_INVALID,
    COLLISION_TOP,
    COLLISION_BOTTOM,
    COLLISION_LEFT,
    COLLISION_RIGHT
};


class Player : public MySprite {
public:
    ~Player();
    static Player* createPlayer(int roleIndex);
    bool initPlayer(int roleIndex);
    
    CC_PROPERTY (PlayerState, currentPlayerState, CurrentPlayerState);

    
    //玩家是否与一个区域碰撞 （地图 或 金币）
    bool isCollisionWithCollArea(COLLISION_DIRECTION dirction, CCRect box);
    
    //得到玩家碰撞区域
    CCRect getCollisionArea();
    
    //当前是否是  二级跳
    CC_SYNTHESIZE(bool, m_isSecondaryJump, IsSecondaryJump);
    

    

    
private:
    //保存角色的字典
    CCDictionary *m_dicAnimate;
    
    //创建角色所有动画
    void initAllAnimate(int roleIndex);
    
    //添加动画到字典中
    void addAnimateToDic(PlayerState state, CCAnimate* animate);
    
    //从字典中取出动画
    CCAnimate* getAnimateFromDic(PlayerState state);
    
    
    //创建移动动画
    void createMove_Animate(CCTexture2D* texture, int row, int col);
    //创建跳跃和降落的动画
    void createJumpAndDescend_Animate(CCTexture2D* texture, int row, int col);
    
    //更新函数
    void player_update(float dt);
    //玩家的逻辑
    void playerLogic();
    
    //跑动逻辑
    void runLogic();
    //跳起逻辑
    void jumpUpLogic();
    //降落逻辑
    void jumpDownLogic();
    //将要死亡
    void willDieLogic();
    //已经死亡
    void didDieLogic();
    //跑完当前关卡地图
    void gameWinLogic();
    
    
    CC_SYNTHESIZE(float, xSpeed, XSpeed);
    CC_SYNTHESIZE(float, ySpeed, YSpeed);
    
    //判断角色上面方碰撞检测
    bool isCollisionWithTop(CCRect box);
    //判断角色下面方碰撞检测
    bool isCollisionWithBottom(CCRect box);
    //判断角色左面方碰撞检测
    bool isCollisionWithLeft(CCRect box);
    //判断角色右面方碰撞检测
    bool isCollisionWithRight(CCRect box);
    
    
    //当前状态是否是 将要死亡 或者 游戏胜利
    CC_SYNTHESIZE(bool, m_isWillDieOrWin, IsWillDieOrWin);


};

#endif /* defined(__XiaoQianRun__Player__) */










