//
//  MenuLayer.cpp
//  Plane
//
//  Created by tarena on 14-6-10.
//
//

#include "MenuLayer.h"
#include "Tools.h"
#include "GameScene.h"
#include "SimpleAudioEngine.h"
using namespace CocosDenshion;

CCScene* MenuLayer::scene() {
    CCScene *scene = CCScene::create();
    MenuLayer *menuLayer = MenuLayer::create();
    scene->addChild(menuLayer);
    return scene;
}

bool MenuLayer::init() {
    if (!CCLayerColor::initWithColor(ccc4(255, 255, 255, 255))) {
        return false;
    }
    
    
//    sprite->getContentSize() {
//        return sprite->getTexture()->getContentSize();
//    }
    

    CCSprite *tarena = CCSprite::create("Menu/tarena.jpg");
    this->addChild(tarena);
    tarena->setPosition(ccp(SCREEN.width * 0.5, SCREEN.height * 0.5));
    
    CCFadeIn *fadeIn = CCFadeIn::create(1.5);
    CCDelayTime *delayTime = CCDelayTime::create(1);
    CCFadeOut *fadeOut = CCFadeOut::create(1.5);
    CCCallFunc *callFunc = CCCallFunc::create(this, callfunc_selector(MenuLayer::showBG));
    CCSequence *seq = CCSequence::create(fadeIn, delayTime, callFunc,fadeOut,  NULL);
   
    tarena->setOpacity(0);
    tarena->runAction(seq);
    
    
    return true;
}

void MenuLayer::showBG() {
    CCSprite *bg = CCSprite::create("Menu/img_bg_logo.jpg");
    this->addChild(bg);
    bg->setAnchorPoint(CCPointZero);
    CCFadeIn *fadeIn = CCFadeIn::create(1.5);
    CCMoveTo *moveTo = CCMoveTo::create(0.8, ccp(0, SCREEN.height - bg->getContentSize().height));
    CCCallFunc *callFunc = CCCallFunc::create(this, callfunc_selector(MenuLayer::showLogo));
    CCSequence *seq = CCSequence::create(fadeIn, moveTo, callFunc, NULL);
    
    //设置透明度为  0
    bg->setOpacity(0);
    bg->runAction(seq);
}

void MenuLayer::showLogo() {
    CCSprite *logo = CCSprite::create("Menu/LOGO.png");
    this->addChild(logo);
    logo->setPosition(ccp(500, -100));
    CCMoveTo *moveTo = CCMoveTo::create(1, ccp(SCREEN.width * 0.5, SCREEN.height * 0.75));
    CCEaseBounceOut *bounceOut = CCEaseBounceOut::create(moveTo);
    CCCallFunc *callFunc = CCCallFunc::create(this, callfunc_selector(MenuLayer::showMenu));
    CCSequence *seq = CCSequence::create(bounceOut, callFunc, NULL);
    logo->runAction(seq);
}

void MenuLayer::showMenu() {
    CCLabelBMFont *bmFont = CCLabelBMFont::create("Start", "font/bitmapFontTest.fnt");
    CCMenuItemLabel *itemlabel = CCMenuItemLabel::create(bmFont, this, menu_selector(MenuLayer::goGameScene));
    itemlabel->setScale(0);
    CCScaleTo *scaleTo = CCScaleTo::create(1, 1);
    CCRotateTo *rotateTo = CCRotateTo::create(1, 3600);
    CCSpawn *spaw = CCSpawn::create(scaleTo, rotateTo, NULL);
    itemlabel->runAction(spaw);
    
    CCMenu *menu = CCMenu::create(itemlabel, NULL);
    this->addChild(menu);
}
void MenuLayer::goGameScene() {
    
    SimpleAudioEngine::sharedEngine()->playEffect("effect_boom.mp3");
    
    int level = 3;
    GameScene *gameScene = GameScene::createGameScene(level);
    
    CCScene *scene =  CCTransitionFlipX::create(1, gameScene);
    
    
    CCDirector::sharedDirector()->replaceScene(scene);
}





