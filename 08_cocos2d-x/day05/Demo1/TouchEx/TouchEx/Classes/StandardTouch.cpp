//
//  StandardTouch.cpp
//  TouchEx
//
//  Created by tarena on 14-6-12.
//
//

#include "StandardTouch.h"
void StandardTouch::onEnter() {
    //指明调用  父类的 onEnter()
    CCNode::onEnter();
    //向分发器中 注册
    CCDirector::sharedDirector()->getTouchDispatcher()->addStandardDelegate(this, 0);
}
void StandardTouch::onExit() {
    //指明调用  父类的 onExit()
    CCNode::onExit();
    //从分发器中 注销
    CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

/*多点触摸默认只响应一个点， 如果要响应多个点，需要在 ios 目录下的 AppController.mm 文件通过 OpenGL 进行开启 */
void StandardTouch::ccTouchesBegan(CCSet *pTouches, CCEvent *pEvent) {
    //得到迭代器对象  指向第一个元素
    CCSetIterator iter = pTouches->begin();
    for (;iter != pTouches->end(); iter++) {
    //把Set中元素的值取出来  (CCTouch*)
    CCTouch *pTouch = (CCTouch*)(*iter);
    //从 CCTouch 中把 位置取出来
    CCPoint position = pTouch->getLocation();
    if (pTouch->getID() == 0) { //第一个点
        CCLog("第一个点----%f  %f ", position.x, position.y);
    }else if(pTouch->getID() == 1){//第二个点
        CCLog("第二个点----%f  %f ", position.x, position.y);
    }
    }
    CCLog("StandardTouch::ccTouchesBegan");
}
void StandardTouch::ccTouchesMoved(CCSet *pTouches, CCEvent *pEvent) {
  CCLog("StandardTouch::ccTouchesMoved");
}
void StandardTouch::ccTouchesEnded(CCSet *pTouches, CCEvent *pEvent) {
    CCLog("StandardTouch::ccTouchesEnded");
}



