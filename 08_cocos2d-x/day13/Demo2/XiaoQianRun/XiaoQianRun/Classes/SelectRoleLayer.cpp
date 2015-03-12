//
//  SelectRoleLayer.cpp
//  XiaoQianRun
//
//  Created by BFM on 13-12-9.
//
//

#include "SelectRoleLayer.h"
#include "SelectButton.h"
#include "SelectLevelLayer.h"
#include "Defines.h"
#include "SimpleAudioEngine.h"
using namespace CocosDenshion;
CCScene* SelectRoleLayer::scene(int mapLevel, int Level) {
    CCScene *scene = CCScene::create();
    SelectRoleLayer *selectRoleLayer = SelectRoleLayer::createSelectRoleLayer(mapLevel, Level);
    scene->addChild(selectRoleLayer);
    return scene;
}


SelectRoleLayer* SelectRoleLayer::createSelectRoleLayer(int mapLevel, int Level) {
    SelectRoleLayer *layer = new SelectRoleLayer();
    if (layer && layer->initSelectSelectSelectRoleLayer(mapLevel, Level)) {
        layer->autorelease();
        return layer;
    }
    CC_SAFE_DELETE(layer);
    return NULL;
}


bool SelectRoleLayer::initSelectSelectSelectRoleLayer(int mapLevel, int Level) {
    if (!CCLayer::init()) return false;
    
    m_mapLevel = mapLevel;
    m_level = Level;
    
    //背景图
    CCSprite *bg = CCSprite::create(CCString::createWithFormat("ui/level/%d.jpg", mapLevel)->getCString());
    this->addChild(bg);
    bg->setAnchorPoint(CCPointZero);
    
    CCSprite *selectBg = CCSprite::create("ui/person/bg.png");
    selectBg->setPosition(ccp(SCREEN.width * 0.5, SCREEN.height * 0.65));
    this->addChild(selectBg);
    
    //人物选择
    CCSprite *rwxz = CCSprite::create("ui/zh-Hans/rwxz.png");
    rwxz->setPosition(ccp(selectBg->getContentSize().width * 0.5, selectBg->getContentSize().height));
    selectBg->addChild(rwxz);
   

    
    //宁采臣
    SelectButton *ncc = SelectButton::createSelectButton(m_mapLevel, m_level, 1);
    selectBg->addChild(ncc);
    //绘制Y的位置
    float Y = selectBg->getContentSize().height - ncc->getShowContentSize().height + 40;
    //间隔距离
    float space = (selectBg->getContentSize().width - ncc->getShowContentSize().width * 4) / 5;
    ncc->setPosition(ccp(space + ncc->getShowContentSize().width * 0.5, Y));
    
    //聂小倩
    SelectButton *nxq = SelectButton::createSelectButton(m_mapLevel, m_level, 2);
    nxq->setPosition(ccp(ncc->getPositionX() + ncc->getShowContentSize().width + space, Y));
     selectBg->addChild(nxq);
    
    //敬请期待1
    SelectButton *jqqd = SelectButton::createSelectButton(m_mapLevel, m_level ,0);
    jqqd->setPosition(ccp(nxq->getPositionX() + nxq->getShowContentSize().width + space, Y));
    selectBg->addChild(jqqd);
    
    //敬请期待2
    SelectButton *jqqd2 = SelectButton::createSelectButton(m_mapLevel, m_level, 0);
    jqqd2->setPosition(ccp(jqqd->getPositionX() + jqqd->getShowContentSize().width + space, Y));
    selectBg->addChild(jqqd2);
    
    
    //人物选择
    CCSprite *persondesc = CCSprite::create("ui/zh-Hans/persondesc.png");
    persondesc->setPosition(ccp(bg->getContentSize().width * 0.5, selectBg->getPositionY() - 180));
    this->addChild(persondesc);
    
    
    //返回菜单
    CCMenuItemImage *itemImage = CCMenuItemImage::create("ui/backBtn.png", NULL, this, menu_selector(SelectRoleLayer::goSelectLevelLayer));
    itemImage->setPosition(ccp(SCREEN.width * 0.2, SCREEN.height * 0.3));
    CCMenu *menu = CCMenu::create(itemImage, NULL);
    menu->setPosition(CCPointZero);
    this->addChild(menu);

    
    return true;
}



void SelectRoleLayer::goSelectLevelLayer() {
      SimpleAudioEngine::sharedEngine()->playEffect("music/button.wav");
    CCDirector::sharedDirector()->replaceScene(SelectLevelLayer::scene(m_mapLevel));
}









