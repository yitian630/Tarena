//
//  Rocker.cpp
//  BombHero
//
//  Created by tarena on 14-6-13.
//
//

#include "Rocker.h"
Rocker* Rocker::createRocker(const char *rockerImageName, const char* rockerBGImageName,CCPoint position) {
    Rocker *rocker = new Rocker();
    if (rocker && rocker->initRocker(rockerImageName, rockerBGImageName, position)) {
        rocker->autorelease();
        return rocker;
    }
    CC_SAFE_DELETE(rocker);
    return NULL;
}
bool Rocker::initRocker(const char *rockerImageName, const char* rockerBGImageName,CCPoint position) {
    if (!CCNode::init()) return false;
    this->setPosition(position);

    //摇杆背景精灵
    m_rockerBGSp = CCSprite::create(rockerBGImageName);
    this->addChild(m_rockerBGSp);
    m_rockerBGSp->setVisible(false);
    
    //摇杆精灵
    m_rockerSp = CCSprite::create(rockerImageName);
    this->addChild(m_rockerSp);
    m_rockerSp->setVisible(false);
    
    
    m_rockerR = m_rockerBGSp->getContentSize().width * 0.5;
    return true;
}
void Rocker::startRocker(){
    CCDirector::sharedDirector()->getTouchDispatcher()->addStandardDelegate(this, 0);
    m_rockerSp->setVisible(true);
    m_rockerBGSp->setVisible(true);
}
void Rocker::stopRocker(){
    CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
    m_rockerSp->setVisible(false);
    m_rockerBGSp->setVisible(false);
}

bool Rocker::isTouchInside(CCTouch *pTouch) {
    //把从Touch中取出位置 转换到 精灵坐标系下
    CCPoint point = m_rockerBGSp->convertToNodeSpace(pTouch->getLocation());
    CCRect rect = CCRectMake(0, 0, m_rockerBGSp->getContentSize().width, m_rockerBGSp->getContentSize().height);
    if (rect.containsPoint(point)) {
        return true;
    }
    return false;
}


void Rocker::ccTouchesBegan(CCSet *pTouches, CCEvent *pEvent){
    CCSetIterator iter = pTouches->begin();
    while (iter != pTouches->end()) {
        CCTouch *touch = (CCTouch*)(*iter);
        if (this->isTouchInside(touch)) {
            tempTouch = touch;
            CCPoint point = this->convertToNodeSpace(touch->getLocation());
            //精灵设置在 触摸的位置
            m_rockerSp->setPosition(point);
            
            //被委托者 处理事件
            m_delegate->touchBegan_de(this, this->getDirection(touch->getLocation()));
            break;
        }
        iter++;
    }

    //英雄移动  飞机移动   坦克移动
}
void Rocker::ccTouchesMoved(CCSet *pTouches, CCEvent *pEvent){
    CCSetIterator iter = pTouches->begin();
    while (iter != pTouches->end()) {
        CCTouch *touch = (CCTouch*)(*iter);
        iter++;
        if (tempTouch && tempTouch == touch) {
            //把 在屏幕上触摸的点 转换到 当前摇杆节点坐标系上
            CCPoint point = this->convertToNodeSpace(tempTouch->getLocation());
            //求距离  是通过屏幕上的点（屏幕坐标系）  和  当前摇杆精灵（RockerLayer坐标系）所在位置  计算两点距离
            if (ccpDistance(tempTouch->getLocation(), this->getPosition()) <= m_rockerR) {
                //如果 移动距离小于等于 半径，说明并没有移除摇杆背景图片
                //精灵设置在 触摸的位置
                m_rockerSp->setPosition(point);
            } else {
                //根据 移除位置 计算 相应半径上的点  并设置精灵位置 到该点上
                 m_rockerSp->setPosition(this->getR_position(tempTouch->getLocation()));
            }
            //被委托者 处理事件
            m_delegate->touchMove_de(this, this->getDirection(tempTouch->getLocation()));
        }
    }
}
void Rocker::ccTouchesEnded(CCSet *pTouches, CCEvent *pEvent){
    CCSetIterator iter = pTouches->begin();
    while (iter != pTouches->end()) {
        CCTouch *touch = (CCTouch*)(*iter);
        iter++;
        if (tempTouch && tempTouch == touch) {
            //如果精灵之前的动作没有做完，停止之前的动作
            m_rockerSp->stopAllActions();
            CCMoveTo *moveTo = CCMoveTo::create(0.1, CCPointZero);
            m_rockerSp->runAction(moveTo);

            
            //被委托者 处理事件
            m_delegate->touchEnd_de(this, this->getDirection(tempTouch->getLocation()));
            
            tempTouch = NULL;
            
        }
        }
}


//根据触摸位置  计算 半径上的点
CCPoint Rocker::getR_position(CCPoint touchPoint) {
    return ccpMult(this->getNormal(touchPoint, this->getPosition()), m_rockerR);
}


//得到 标准化向量
CCPoint Rocker::getNormal(CCPoint pos, CCPoint pos1) {
    CCPoint point = ccpSub(pos, pos1);
    return ccpNormalize(point);
}

//通过触摸的位置  计算 当前摇杆方向
RockerDirection Rocker::getDirection(CCPoint touchPosition) {
    CCPoint pointNode = this->convertToNodeSpace(touchPosition);
    float pValueX, pValueY;
    pValueX = pointNode.x;
    pValueY = pointNode.y;
    if (pValueX > 0 && abs(pValueX) >= abs(pValueY)) {
        return DIR_RIGHT;
    }else if (pValueX < 0 && abs(pValueX) >= abs(pValueY)) {
        return DIR_LEFT;
    }else if (pValueY > 0 && abs(pValueY) > abs(pValueX)) {
        return DIR_UP;
    }else if (pValueY < 0 && abs(pValueY) > abs(pValueX)) {
        return DIR_DOWn;
    }else {
        return DIR_DEFAULT;
    }
}



