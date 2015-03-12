//
//  SelectMapLayer.h
//  XiaoQianRun
//
//  Created by ZX on 13-12-9.
//
//

#ifndef __XiaoQianRun__SelectMapLayer__
#define __XiaoQianRun__SelectMapLayer__

#include <iostream>
#include "cocos2d.h"
#include "cocos-ext.h"
USING_NS_CC;
USING_NS_CC_EXT;

#define map_space 18;

class SelectMapLayer : public CCLayer,
public CCScrollViewDelegate{
public:
    static CCScene* scene();
    CREATE_FUNC(SelectMapLayer);
    bool init();
private:
    //scrollView滑动时调用
    virtual void scrollViewDidScroll(CCScrollView* view);
    //scrollView缩放时调用
    virtual void scrollViewDidZoom(CCScrollView* view);

    CCScrollView *m_scrollView;
    //ScrollView 显示内容
    CCLayer *m_containerLayer;

    CCPoint m_touchPoint;
    
    virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
    virtual void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);
    
    //调整 ScrollView
    void adjustScrollView(float offset);
    //当前显示地图
    int m_currentMapPage;
    //最大地图数
    int m_maxMapPage;
    //每页的宽度
    float m_mapPageWidth;

};


#endif /* defined(__XiaoQianRun__SelectMapLayer__) */














