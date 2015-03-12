//
//  RockerButton.h
//  BombHero
//
//  Created by tarena on 14-6-13.
//
//

#ifndef __BombHero__RockerButton__
#define __BombHero__RockerButton__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

typedef void (CCObject::*FUNCTION_NAME)(CCObject*);
#define function_selector(_SELECT) (FUNCTION_NAME)(&_SELECT)

typedef enum {
    BUTTON,
    CHANGE_BUTTON
}ButtonType;


class RockerButton : public CCNode, public CCStandardTouchDelegate {
public:
    /********* 普通按键 ************/
    static RockerButton* creatButton(const char* buttonImageName, CCPoint position, CCObject *target,FUNCTION_NAME m_funtion);
    bool initButton(const char* buttonImageName, CCPoint position, CCObject *target,FUNCTION_NAME m_funtion);
    
    /********* 换图按键 ************/
    static RockerButton* creatButtonWithChangeImage(const char* buttonImageName, const char* selectImageName, CCPoint position, CCObject *target,FUNCTION_NAME m_funtion);

    
    
//     static RockerButton* creatButtonWithScale
//    static RockerButton* creatButtonWithChangeImage
    
    void startButton();
    void stopButton();
private:
    CCSprite *m_showSprite;
    CCSprite *m_showSprite1;
    
    //是否 点中精灵
    bool isTouchInside(CCTouch *pTouch);
    // optional
    virtual void ccTouchesBegan(CCSet *pTouches, CCEvent *pEvent);
    virtual void ccTouchesMoved(CCSet *pTouches, CCEvent *pEvent);
    virtual void ccTouchesEnded(CCSet *pTouches, CCEvent *pEvent);
    
    //事件 执行的 目标
    CCObject *m_target;
    //声明 成员函数指针 变量
    FUNCTION_NAME m_funtion;
    
    ButtonType m_bType;
    
    int m_tempTouchId;
};



#endif /* defined(__BombHero__RockerButton__) */
