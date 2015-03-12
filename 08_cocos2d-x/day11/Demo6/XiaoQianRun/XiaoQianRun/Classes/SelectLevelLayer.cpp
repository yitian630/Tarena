//
//  SelectLevelLayer.cpp
//  XiaoQianRun
//
//  Created by BFM on 13-12-9.
//
//

#include "SelectLevelLayer.h"
#include "Defines.h"
#include "SelectLevelButton.h"
#include "GameData.h"
#include "SimpleAudioEngine.h"
using namespace CocosDenshion;
CCScene* SelectLevelLayer::scene(int mapLevel) {
    CCScene *scene = CCScene::create();
    SelectLevelLayer *selectLevelLayer = SelectLevelLayer::createSelectLevelLayer(mapLevel);
    scene->addChild(selectLevelLayer);
    return scene;
}


SelectLevelLayer* SelectLevelLayer::createSelectLevelLayer(int mapLevel) {
    SelectLevelLayer *layer = new SelectLevelLayer();
    if (layer && layer->initSelectSelectLevelLayer(mapLevel)) {
        layer->autorelease();
        return layer;
    }
    CC_SAFE_DELETE(layer);
    return NULL;
}

bool SelectLevelLayer::initSelectSelectLevelLayer(int mapLevel) {
    if (!CCLayer::init()) return false;
    //背景图
    CCSprite *bg = CCSprite::create(CCString::createWithFormat("ui/level/%d.jpg", mapLevel)->getCString());
    bg->setAnchorPoint(CCPointZero);
    this->addChild(bg);
    
    //选择地图的背景框
    CCSprite *selectFrameBg = CCSprite::create("ui/level/k2.png");
    selectFrameBg->setPosition(ccp(SCREEN.width * 0.5, SCREEN.height * 0.55));
    this->addChild(selectFrameBg);
    
    for (int i = 0; i < 10; i ++) {
        SelectLevelButton *button = SelectLevelButton::createSelectLevelButton(mapLevel, i + 1);
        float spaceW = (selectFrameBg->getContentSize().width - button->getShowContentSize().width * 5) / 6.0;
        float spaceH = (selectFrameBg->getContentSize().height - button->getShowContentSize().height * 2) / 3.0;
        button->setPosition(ccp(
                                (button->getShowContentSize().width + spaceW) * (i % 5) + spaceW +button->getShowContentSize().width * 0.5,
                                selectFrameBg->getContentSize().height - ((button->getShowContentSize().height + spaceH) * (i / 5) + spaceH + button->getShowContentSize().height * 0.5)));
        selectFrameBg->addChild(button);
        //如果大关 等于 保存的大关等级  说明当前大关没有全部完成 需要继续判断小关  开启情况
        if (mapLevel == GameData::sharedGameData()->getMapLevel()) {
            if (i + 1 < GameData::sharedGameData()->getLevel()) {
                //已经完成的关卡
                button->finish(S);
            } else if (i + 1 == GameData::sharedGameData()->getLevel()) {
                //打开但没完成
                button->unLock();
            }
        //如果大关 < 保存的大关等级  说明当前大关已经全部完成
        } else if (mapLevel < GameData::sharedGameData()->getMapLevel()) {
                //已经完成的关卡
                button->finish(S);
        }
    }
    
    //选择关卡的图片精灵
    CCSprite *ui_top = CCSprite::create("ui/zh-Hans/level_logo.png");
    selectFrameBg->addChild(ui_top);
    ui_top->setPosition(ccp(selectFrameBg->getContentSize().width * 0.5, selectFrameBg->getContentSize().height));
    
    //返回按键
    CCMenuItemImage *itemImage = CCMenuItemImage::create("ui/backBtn.png", NULL, this, menu_selector(SelectLevelLayer::goSelectMapLayer));
    itemImage->setPosition(ccp(SCREEN.width * 0.1, SCREEN.height * 0.1));
    CCMenu *menu = CCMenu::create(itemImage, NULL);
    menu->setPosition(CCPointZero);
    this->addChild(menu);

    return true;
}

void SelectLevelLayer::goSelectMapLayer() {
      SimpleAudioEngine::sharedEngine()->playEffect("music/button.wav");
    CCDirector::sharedDirector()->replaceScene(SelectMapLayer::scene());
}




