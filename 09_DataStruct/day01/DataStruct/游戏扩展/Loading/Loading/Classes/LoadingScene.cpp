//
//  LoadingScene.cpp
//  Loading
//
//  Created by tarena on 14-6-25.
//
//

#include "LoadingScene.h"
#include "GameScene.h"
CCScene* LoadingScene::scene() {
    CCScene *scene = CCScene::create();
    LoadingScene *layer = LoadingScene::create();
    scene->addChild(layer);
    return scene;
}

bool LoadingScene::init() {
    if (!CCLayer::init()) return false;
    
    CCSize winSize = CCDirector::sharedDirector()->getWinSize();
    
    CCSprite *bg = CCSprite::create("login_bg.png");
    this->addChild(bg);
    bg->setPosition(ccp(winSize.width * 0.5, winSize.height * 0.5));
    
    CCSprite *loading = CCSprite::create("login_jd.png");
//    this->addChild(loading);
//    loading->setPosition(ccp(winSize.width * 0.585, winSize.height * 0.485));
    CCProgressTimer *progress = CCProgressTimer::create(loading);
    this->addChild(progress, 0, 100);
    //设置中点  向外延伸
    progress->setMidpoint(ccp(0, 0));
    progress->setType(kCCProgressTimerTypeBar);
    //延伸方向
    progress->setBarChangeRate(ccp(1, 0));
    progress->setPosition(ccp(winSize.width * 0.585, winSize.height * 0.485));
    //进度 一开始 百分比  0
    progress->setPercentage(0);
    
    count = 0;
    
    this->resources();
    
    
    CCLabelBMFont *bmFont = CCLabelBMFont::create("0", "Font.fnt");
    this->addChild(bmFont, 0, 200);
    bmFont->setPosition(ccp(480, 400));
    return true;
}

void LoadingScene::resources() {
    
    
    for (int i = 0; i < 7; i++) {
        for (int j = 0; j < 3; j++) {
            CCTextureCache::sharedTextureCache()->addImageAsync( CCString::createWithFormat("map/map%d_%d.png", i + 1, j + 1)->getCString(), this, callfuncO_selector(LoadingScene::loadCallBack));
        }
    }
}
void LoadingScene::loadCallBack() {
    count++;
    CCProgressTimer *timer = (CCProgressTimer*)this->getChildByTag(100);
    timer->setPercentage(count / 21.0 * 100);
    
    
    CCLabelBMFont *bmFont = (CCLabelBMFont*)this->getChildByTag(200);
    bmFont->setString(CCString::createWithFormat("%d%%", (int)(count / 21.0 * 100))->getCString());
    
    
    if (count == 21) {
        CCDirector::sharedDirector()->replaceScene(GameScene::scene());
    }
    
    
}

