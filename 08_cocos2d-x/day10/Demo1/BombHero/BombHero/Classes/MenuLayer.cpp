//
//  MenuLayer.cpp
//  BombHero
//
//  Created by tarena on 14-6-12.
//
//

#include "MenuLayer.h"
#include "SelectLevelLayer.h"
#include "Defines.h"
#include "SimpleAudioEngine.h"
using namespace CocosDenshion;
MenuLayer::~MenuLayer() {
    CCLog("----------------");
}

CCScene* MenuLayer::scene() {
    CCScene *scene = CCScene::create();
    MenuLayer *layer = MenuLayer::create();
    scene->addChild(layer);
    return scene;
}

bool MenuLayer::init() {
    if(!CCLayer::init()) return  false;
    SimpleAudioEngine::sharedEngine()->playBackgroundMusic("snd/zhujiemian.mp3", true);
    SimpleAudioEngine::sharedEngine()->setBackgroundMusicVolume(0.3);
    SimpleAudioEngine::sharedEngine()->setEffectsVolume(1);
    
    CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile("Menu/menu.plist");
    
    CCSprite *bg = CCSprite::createWithSpriteFrameName("MenuBg.png");
    bg->setAnchorPoint(CCPointZero);
    this->addChild(bg);
    
    CCSprite *logo = CCSprite::createWithSpriteFrameName("logo.png");
    logo->setPosition(ccp(SCREEN.width * 0.5, SCREEN.height + logo->getContentSize().height * 0.5));
    
    CCMoveTo *moveTo = CCMoveTo::create(1, ccp(SCREEN.width * 0.5, SCREEN.height * 0.8));
    CCEaseBounceOut *bounOut = CCEaseBounceOut::create(moveTo);
    logo->runAction(bounOut);
    this->addChild(logo);
    
    
    CCSprite *switch_bg = CCSprite::createWithSpriteFrameName("Switch_bg.png");
    this->addChild(switch_bg);
    switch_bg->setAnchorPoint(ccp(1, 1));
    switch_bg->setPosition(ccp(SCREEN.width, SCREEN.height));
    
    
    
    CCLabelBMFont *bmFont = CCLabelBMFont::create("Start", "Font.fnt");
    CCMenuItemLabel *itemLabel = CCMenuItemLabel::create(bmFont, this, menu_selector(MenuLayer::goSelectLevelScene));
    itemLabel->setPosition(ccp(SCREEN.width * 0.5, SCREEN.height * 0.5));
    
    //音乐开关
    CCMenuItemSprite *on = CCMenuItemSprite::create(CCSprite::createWithSpriteFrameName("on.png"), NULL);
    CCMenuItemSprite *off = CCMenuItemSprite::create(CCSprite::createWithSpriteFrameName("off.png"), NULL);
    CCMenuItemToggle *toggle = CCMenuItemToggle::createWithTarget(this, menu_selector(MenuLayer ::musicToggle), on, off, NULL);
    toggle->setPosition(ccp(switch_bg->getPositionX() - switch_bg->getContentSize().width * 0.5, switch_bg->getPositionY() - switch_bg->getContentSize().height * 0.5));
    
    
    
    CCMenu *menu = CCMenu::create(itemLabel, toggle, NULL);
    menu->setPosition(CCPointZero);
    
    this->addChild(menu);
    
    
    
    return true;
}


void MenuLayer::goSelectLevelScene() {
    SimpleAudioEngine::sharedEngine()->playEffect("snd/bomb_explode.mp3");
    CCDirector::sharedDirector()->replaceScene(CCTransitionFade::create(1, SelectLevelLayer::scene()));
}

void MenuLayer::musicToggle(){
    
}




