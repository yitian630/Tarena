//
//  MyBox2d.h
//  MyBox2D_Ex
//
//  Created by apple on 13-12-28.
//
//

#ifndef __MyBox2D_Ex__MyBox2d__
#define __MyBox2D_Ex__MyBox2d__

#include <iostream>
#include "cocos2d.h"
#include "Box2D.h"
USING_NS_CC;

class MyBox2D : public CCLayer,
public b2ContactListener{
public:
    static CCScene* scene();
    CREATE_FUNC(MyBox2D);
    bool init();
private:
    b2World* _world;
    CCSize _size;
    //初始化屏幕
    void initScreenFrame();
    //纹理对象
    CCTexture2D* _spriteTexture;
    
    //添加一个精灵
    void addNewSpriteAtPosition(CCPoint pos);
    
    void update(float dt);
    
    virtual void ccTouchesEnded(cocos2d::CCSet* touches, cocos2d::CCEvent* event);
    
    //添加关节
    void addSomeJonintBodies(CCPoint pos);
    
    //加速计 重力感应
    virtual void didAccelerate(cocos2d::CCAcceleration* pAccelerationValue);

    virtual void BeginContact(b2Contact* contact);
    
    /// Called when two fixtures cease to touch.
    virtual void EndContact(b2Contact* contact);
};
#endif /* defined(__MyBox2D_Ex__MyBox2d__) */
