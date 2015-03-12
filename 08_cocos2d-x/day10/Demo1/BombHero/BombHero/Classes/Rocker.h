//
//  Rocker.h
//  BombHero
//
//  Created by tarena on 14-6-13.
//
//

#ifndef __BombHero__Rocker__
#define __BombHero__Rocker__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;
typedef enum{
    DIR_UP,
    DIR_DOWn,
    DIR_LEFT,
    DIR_RIGHT,
    DIR_DEFAULT
}RockerDirection;


class RockerDelegate{
public:
    virtual void touchBegan_de(CCObject *rocker, RockerDirection dir) = 0;
    virtual void touchMove_de(CCObject *rocker, RockerDirection dir) = 0;
    virtual void touchEnd_de(CCObject *rocker, RockerDirection dir) = 0;
};

class Rocker : public CCNode, public CCStandardTouchDelegate {
public:
    static Rocker* createRocker(const char *rockerImageName, const char* rockerBGImageName,CCPoint position);
    bool initRocker(const char *rockerImageName, const char* rockerBGImageName,CCPoint position);
    void startRocker();
    void stopRocker();
    
    CC_SYNTHESIZE(RockerDelegate*, m_delegate, Delegate);
    
private:
    CCSprite *m_rockerSp;
    CCSprite *m_rockerBGSp;
    
    bool isTouchInside(CCTouch *pTouch);
    
    
    virtual void ccTouchesBegan(CCSet *pTouches, CCEvent *pEvent);
    virtual void ccTouchesMoved(CCSet *pTouches, CCEvent *pEvent);
    virtual void ccTouchesEnded(CCSet *pTouches, CCEvent *pEvent);
    
    CCTouch *tempTouch;
    
    float m_rockerR;
    
    //根据触摸位置  计算 半径上的点
    CCPoint getR_position(CCPoint touchPoint);
    
    //得到 标准化向量
    CCPoint getNormal(CCPoint pos, CCPoint pos1);
    
    //通过触摸的位置  计算 当前摇杆方向
    RockerDirection getDirection(CCPoint touchPosition);
};

#endif /* defined(__BombHero__Rocker__) */


