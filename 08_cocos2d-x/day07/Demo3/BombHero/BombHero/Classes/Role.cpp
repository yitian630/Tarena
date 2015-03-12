//
//  Role.cpp
//  BombHero
//
//  Created by tarena on 14-6-16.
//
//

#include "Role.h"
Role::~Role() {
    CC_SAFE_RELEASE(m_dictionary);
}
bool Role::initRole() {
    if (!CCNode::init()) return false;
    
    m_showSprite = CCSprite::create();
    this->addChild(m_showSprite);
    
    m_dictionary = CCDictionary::create();
    CC_SAFE_RETAIN(m_dictionary);
    
    m_roleDir = Role_Count;
    return true;
}

//向字典中添加 动画对象
void Role::addAnimate(CCAnimate *animate, Action_State state, Role_Dir dir) {
    m_dictionary->setObject(animate, CCString::createWithFormat("%d%d", state, dir)->getCString());
}
//向字典中取动画
CCAnimate* Role::getAnimate( Action_State state, Role_Dir dir) {
    return (CCAnimate*)m_dictionary->objectForKey(CCString::createWithFormat("%d%d", state, dir)->getCString());
}

CCAnimate* Role::createAnimate(const char *spriteFramName, int frameCount) {
    CCAnimation *animation = CCAnimation::create();
    for (int i = 0; i < frameCount; i++) {
        CCSpriteFrame *frame = CCSpriteFrameCache::sharedSpriteFrameCache()->spriteFrameByName(CCString::createWithFormat(spriteFramName, i+1)->getCString());
        animation->addSpriteFrame(frame);
    }
    animation->setDelayPerUnit(0.22);
    animation->setLoops(-1);
    return CCAnimate::create(animation);
}


//创建移动动画
void Role::addMoveAnimate(std::string* frameNames, int frameCount) {
    for (int i = Role_UP; i < Role_Count; i++) {
        CCAnimate *animate = this->createAnimate(frameNames[i].c_str(), frameCount);
        this->addAnimate(animate, Role_Move, (Role_Dir)i);
    }
}
//创建站立动画
void Role::addStandAnimate(std::string* frameNames, int frameCount) {
    for (int i = Role_UP; i < Role_Count; i++) {
        CCAnimate *animate = this->createAnimate(frameNames[i].c_str(), frameCount);
        this->addAnimate(animate, Role_Stand, (Role_Dir)i);
    }
}
//创建将要死亡动画
void Role::addWillDieAnimate(std::string frameName) {
        CCAnimate *animate = this->createAnimate(frameName.c_str(), 1);
        this->addAnimate(animate, Role_WillDie, Role_Down);
}

//运行移动动画
void Role::runRole_MoveAnimation(Role_Dir changeDir) {
    if (m_rolestate == Role_Move && changeDir == m_roleDir ) {
        return;
    }
    if (m_rolestate != Role_Move) {
        m_rolestate = Role_Move;
    }
    m_roleDir = changeDir;
    m_showSprite->stopAllActions();
    m_showSprite->runAction(this->getAnimate(m_rolestate, m_roleDir));
}
//运行站立的动画
void Role::runRole_StandAnimation() {
    m_rolestate = Role_Stand;
    m_showSprite->stopAllActions();
    m_showSprite->runAction(this->getAnimate(m_rolestate, m_roleDir));
    
}
//运行将要死亡的动画
void Role::runRole_WillDie() {
    
}


//角色移动
CCPoint Role::roleMove() {
    CCPoint movePoint;
    switch ((int)m_roleDir) {
        case Role_UP:
            movePoint = ccp(0, m_speed);
            break;
        case Role_Down:
            movePoint = ccp(0, -m_speed);
            break;
        case Role_Left:
            movePoint = ccp(-m_speed, 0);
            break;
        case Role_Right:
            movePoint = ccp(m_speed, 0);
            break;
    }
    this->setPosition(ccpAdd(this->getPosition(), movePoint));
    return movePoint;
}






