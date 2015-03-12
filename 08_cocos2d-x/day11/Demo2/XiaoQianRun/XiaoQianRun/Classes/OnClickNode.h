//
//  OnClickNode.h
//  XiaoQianRun
//
//  Created by BFM on 13-12-9.
//
//

#ifndef __XiaoQianRun__OnClickNode__
#define __XiaoQianRun__OnClickNode__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class OnClickNode : public CCNode,
public CCTargetedTouchDelegate{
public:
    //设置显示内容
    void setShowContent(CCSprite *showContent);
    
    //得到显示 内容尺寸   (用于检测是否选中当前节点)
    CCSize getShowContentSize();
    
protected:
    void onEnter();
    void onExit();
    //判断是否  点中当前节点
    bool isTouchInside(CCTouch* touch);
private:
    CCSprite *m_sprite;
};

#endif /* defined(__XiaoQianRun__OnClickNode__) */
