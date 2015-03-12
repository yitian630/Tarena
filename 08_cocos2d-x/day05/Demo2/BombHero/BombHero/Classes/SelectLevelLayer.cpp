//
//  SelectLevelLayer.cpp
//  BombHero
//
//  Created by tarena on 14-6-12.
//
//

#include "SelectLevelLayer.h"
#include "MenuLayer.h"
#include "Defines.h"
CCScene* SelectLevelLayer::scene() {
    CCScene *scene = CCScene::create();
    SelectLevelLayer *layer = SelectLevelLayer::create();
    scene->addChild(layer);
    return scene;
}

bool SelectLevelLayer::init() {
    if(!CCLayer::init()) return false;
   CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("SelectLevel/selectLevel.plist");
    
    CCSprite *bg = CCSprite::createWithSpriteFrameName("selectLevel_bg.png");
    this->addChild(bg);
    bg->setAnchorPoint(CCPointZero);
    
    
    
    CCMenuItemSprite *itemSprite = CCMenuItemSprite::create(CCSprite::createWithSpriteFrameName("selectLevel_back.png"), NULL , this, menu_selector(SelectLevelLayer::goMenu));
    itemSprite->setAnchorPoint(ccp(0,1));
    itemSprite->setPosition(ccp(0, SCREEN.height));
    
    
    
    CCMenu *menu = CCMenu::create(itemSprite, NULL);
    menu->setPosition(CCPointZero);
    this->addChild(menu);
    
    
    return true;
}

void SelectLevelLayer::goMenu() {
    CCDirector::sharedDirector()->replaceScene(CCTransitionFade::create(1, MenuLayer::scene()));
}
