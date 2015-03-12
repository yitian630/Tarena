//
//  MySprite.h
//  XiaoQianRun
//
//  Created by BFM on 13-12-2.
//
//

#ifndef __XiaoQianRun__MySprite__
#define __XiaoQianRun__MySprite__

#include <iostream>
#include "cocos2d.h"

USING_NS_CC;
class MySprite : public CCNode {
public:
    MySprite();
    ~MySprite();
    //获取精灵
    CCSprite* getSprite();
    //绑定精灵
    void bindSprite(CCSprite *sprite);
    //切换精灵
    void replaceSprite(CCSprite *sprite);
private:
    CCSprite *m_sprite;
};


#endif /* defined(__XiaoQianRun__MySprite__) */
