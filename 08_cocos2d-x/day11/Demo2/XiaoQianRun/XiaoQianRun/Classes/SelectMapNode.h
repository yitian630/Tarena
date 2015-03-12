//
//  SelectMapNode.h
//  XiaoQianRun
//
//  Created by ZX on 13-12-9.
//
//

#ifndef __XiaoQianRun__SelectMapNode__
#define __XiaoQianRun__SelectMapNode__

#include <iostream>
#include "OnClickNode.h"
#include "cocos2d.h"
USING_NS_CC;

//每一页的对象
class SelectMapNode : public OnClickNode{
public:
    static SelectMapNode* createSelectMapNode(int mapLevel);
    bool initSelectMapNode(int mapLevel);

private:

    bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
    void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
    void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);

    int m_mapLevel;
    //是否选中该节点
    bool m_isTouchInside;

};

#endif /* defined(__XiaoQianRun__SelectMapNode__) */
