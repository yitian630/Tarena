//
//  MenuScene.cpp
//  XiaoQianRun
//
//  Created by BFM on 13-12-8.
//
//

#include "MenuScene.h"
#include "MenuSceneLoader.h"
#include "SelectMapLayer.h"
#include "SimpleAudioEngine.h"
using namespace CocosDenshion;

CCScene* MenuScene::scene() {
    CCScene *scene = CCScene::create();
    CCNodeLoaderLibrary *library = CCNodeLoaderLibrary::newDefaultCCNodeLoaderLibrary();
    library->registerCCNodeLoader("menu", MenuSceneLoader::loader());
    CCBReader *bReader = new CCBReader(library);
    MenuScene *menuScene = (MenuScene*)bReader->readNodeGraphFromFile("Menu/ccbi/menu.ccbi");
    scene->addChild(menuScene);
    return scene;
}

bool MenuScene::init() {
    SimpleAudioEngine::sharedEngine()->playBackgroundMusic("music/menuBg.mp3", true);
    return true;
}

SEL_MenuHandler MenuScene::onResolveCCBCCMenuItemSelector(CCObject * pTarget, const char* pSelectorName) {
    CCB_SELECTORRESOLVER_CCMENUITEM_GLUE(this, "onStart", MenuScene::onStart);
    return NULL;
}
SEL_CCControlHandler MenuScene::onResolveCCBCCControlSelector(CCObject * pTarget, const char* pSelectorName) {
    return NULL;
}

void MenuScene::onStart() {
    SimpleAudioEngine::sharedEngine()->playEffect("music/button.wav");
    CCDirector::sharedDirector()->replaceScene(SelectMapLayer::scene());
    CCLog("开始游戏");
}


