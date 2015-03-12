//
//  SunWuKong.cpp
//  SWK
//
//  Created by tarena on 14-6-24.
//
//

#include "SunWuKong.h"
#include "SunWuKongLoader.h"
#include "MapLayer.h"
SunWuKong* SunWuKong::createSWK() {
    CCNodeLoaderLibrary *library = CCNodeLoaderLibrary::newDefaultCCNodeLoaderLibrary();
    library->registerCCNodeLoader("SWK", SunWuKongLoader::loader());
    CCBReader *bReader = new CCBReader(library);
    SunWuKong *swk = (SunWuKong*)bReader->readNodeGraphFromFile("ccbi/sunWuKong.ccbi");
    swk->initSunWuKong(bReader);
    return swk;
}

bool SunWuKong::initSunWuKong(CCBReader *bReader){
    if (!CCNode::init()) return false;
    m_manager = bReader->getAnimationManager();
    
    this->idle();
    
    this->scheduleUpdate();
    
    return true;
}

void SunWuKong::idle() {
    m_swkState = IDLE;
    //"idle" 是 CocosBuilder中 时间线的名字
    m_manager->runAnimationsForSequenceNamed("idle");
}
void SunWuKong::walk(CCPoint normalizer) {
    if (m_swkState != WALK) {
        m_swkState = WALK;
        m_manager->runAnimationsForSequenceNamed("walk");
    }
    m_normalizer = normalizer;
    if (m_normalizer.x < 0) {
        this->setRotationY(180);
    }else {
        this->setRotationY(0);
    }
}
void SunWuKong::attack() {
    m_swkState = ATTACK;
     m_manager->runAnimationsForSequenceNamed("attack0");
}
void SunWuKong::effect() {
    m_swkState = EFFECT;
     m_manager->runAnimationsForSequenceNamed("effect1");
}

void SunWuKong::update(float time) {
    if (m_swkState == WALK) {
        this->setPosition(ccpAdd(this->getPosition(), ccpMult(m_normalizer, speed)));
    }
}

SEL_MenuHandler SunWuKong::onResolveCCBCCMenuItemSelector(CCObject * pTarget, const char* pSelectorName){
    return NULL;
}
SEL_CallFuncN SunWuKong::onResolveCCBCCCallFuncSelector(CCObject * pTarget, const char* pSelectorName) {
    CCB_SELECTORRESOLVER_CALLFUNC_GLUE(this, "ZhenDong", SunWuKong::ZhenDong);
    return NULL;
}
SEL_CCControlHandler SunWuKong::onResolveCCBCCControlSelector(CCObject * pTarget, const char* pSelectorName) {
    return NULL;
}

void SunWuKong::ZhenDong() {
    CCMoveBy *moveBy = CCMoveBy::create(0.15, ccp(0, -40));
    CCMoveBy *moveBy1 = CCMoveBy::create(0.15, ccp(0, 70));
    CCMoveBy *moveBy2 = CCMoveBy::create(0.2, ccp(0, -35));
    CCMoveBy *moveBy3 = CCMoveBy::create(0.25, ccp(0, 5));
    CCSequence *seq = CCSequence::create(moveBy, moveBy1, moveBy2, moveBy3, NULL);
    MapLayer *mapLayer = (MapLayer*)this->getParent();
    CCEaseBounceOut *out = CCEaseBounceOut::create(seq);
    mapLayer->m_map->runAction(out);
    mapLayer->m_fg->runAction((CCEaseBounceOut*)out->copy());
}

