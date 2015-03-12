//
//  SelectMapLayer.cpp
//  XiaoQianRun
//
//  Created by ZX on 13-12-9.
//
//

#include "SelectMapLayer.h"
#include "Defines.h"
#include "SelectMapNode.h"

CCScene* SelectMapLayer::scene() {
    CCScene *scene = CCScene::create();
    SelectMapLayer *mapLayer = SelectMapLayer::create();
    scene->addChild(mapLayer);
    return scene;
}

bool SelectMapLayer::init() {
    if (!CCLayer::init()) return false;
    
    m_currentMapPage = 1;
    m_maxMapPage = 5;
    
    this->setTouchMode(kCCTouchesOneByOne);
    this->setTouchEnabled(true);
    
    //场景背景
    CCSprite *bg = CCSprite::create("Menu/back.jpg");
    bg->setAnchorPoint(CCPointZero);
    this->addChild(bg);

    //ScrollView 显示的内容
    m_containerLayer = CCLayer::create();

    for (int i = 0; i < m_maxMapPage; i ++) {
        //创建每大关地图选项
        SelectMapNode *mapNode = SelectMapNode::createSelectMapNode(i + 1);
        mapNode->setPosition(ccp((mapNode->getShowContentSize().width * 0.5 + map_space) + (mapNode->getShowContentSize().width + map_space) * i, 0));
        
        
        //讲节点 添加  内容的层中
        m_containerLayer->addChild(mapNode);
        
        if (i == m_maxMapPage - 1) { //最后一个精灵
            //每页的地图宽度
            m_mapPageWidth = mapNode->getShowContentSize().width + map_space;
            
            float container_W = (mapNode->getShowContentSize().width * 0.5 + map_space) * 2 + m_mapPageWidth * m_maxMapPage;
            float container_H = mapNode->getShowContentSize().height;
            //设置现实内容层 的  大小
            m_containerLayer->setContentSize(CCSizeMake(container_W, container_H));//设置滚动区域的大小
        }
    }
    
    m_scrollView = CCScrollView::create();
    m_scrollView->setPosition(ccp(0, SCREEN.height * 0.3));
    
    //设置view的大小   (显示区域 W 是 屏幕宽度,    H 是 显示内容层的高)
    m_scrollView->setViewSize(CCSizeMake(SCREEN.width, m_containerLayer->getContentSize().height));
    
    //显示滑动的区域大小 scrollview的实际大小
    m_scrollView->setContentSize(m_containerLayer->getContentSize());
    
    //设置scrollview偏移量的大小
    m_scrollView->setContentOffset(CCPointZero);
    
    //设置 ScrollView 内容
    m_scrollView->setContainer(m_containerLayer);
    
    //开启 ScrollView 的触摸
    m_scrollView->setTouchEnabled(true);
    
    //设置滚动的方向
    m_scrollView->setDirection(kCCScrollViewDirectionHorizontal);
    m_scrollView->setDelegate(this);

    
    this->addChild(m_scrollView);
    return true;
}
//scrollView滑动时调用
void SelectMapLayer::scrollViewDidScroll(CCScrollView* view) {
    
}
//scrollView缩放时调用
void SelectMapLayer::scrollViewDidZoom(CCScrollView* view) {
//    m_containerLayer;
}

bool SelectMapLayer::ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent) {
    m_touchPoint = pTouch->getLocation();
    return true;
}
void SelectMapLayer::ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent) {
}
void SelectMapLayer::ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent) {
    CCPoint endPoint = pTouch->getLocation();
    float distance = endPoint.x - m_touchPoint.x;
    //移动距离大于10
    if(fabs(distance) > 10)
    {
        //调整 ScrollView的 位置
        adjustScrollView(distance);
    }
}

void SelectMapLayer::adjustScrollView(float offset) {
    //调整的位置
    CCPoint adjustPos;
    if (offset < 0) { //向左
        m_currentMapPage ++;
        if (m_currentMapPage < m_maxMapPage) {
            adjustPos = ccp(- (m_currentMapPage - 1) * m_mapPageWidth ,0);
        } else {
            m_currentMapPage = m_maxMapPage;
            adjustPos = ccp(- (m_currentMapPage - 1) * m_mapPageWidth ,0);
        }
    }
    
    if (offset > 0) { //向右
        if (m_currentMapPage > 1) {
            m_currentMapPage --;
            adjustPos = ccp(- (m_currentMapPage - 1) * m_mapPageWidth ,0);
        } else {
            m_currentMapPage = 1;
            adjustPos = ccp(0 ,0);
        }
    }
    
    // 关闭CCScrollView中的自调整
    m_scrollView->unscheduleAllSelectors();
    // 设置ScrollView偏移量
    m_scrollView->setContentOffset(adjustPos, true);
}





